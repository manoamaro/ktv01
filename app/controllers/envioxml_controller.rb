require 'rexml/document'
include REXML

class EnvioxmlController < ApplicationController
  
  def index
    
  end

  def enviar
    @doc = Document.new(params[:xml])
    xsd = Nokogiri::XML::Schema(open("#{Rails.root}/doc/rules.xsd").read)
    xml = Nokogiri::XML params[:xml]
    
    unless xsd.valid?(xml)
      render :text => 'XML INVALIDO.'
    else
      @interacao = Interacao.new
      @interacao.data = XPath.first(@doc, "//interacao/data").text.to_datetime
      @interacao.tempo = XPath.first(@doc, "//interacao/tempo").text.to_i
      
      @interacao.programa = Programa.find_or_initialize_by_nome(XPath.first(@doc, "//interacao/programa/nome").text.to_s)
      @interacao.programa.sinopse = XPath.first(@doc, "//interacao/programa/sinopse").text.to_s
      @interacao.programa.duracao = XPath.first(@doc, "//interacao/programa/duracao").text.to_i
      @interacao.programa.classificacao = Classificacao.find(XPath.first(@doc, "//interacao/programa/classificacao").text.to_i)
      
      emissora = Emissora.find_or_create_by_nome_and_canal(XPath.first(@doc, "//interacao/programa/programacao/emissora/nome").text.to_s, XPath.first(@doc, "//interacao/programa/programacao/emissora/canal").text.to_i)
      inicio = XPath.first(@doc, "//interacao/programa/programacao/inicio").text.to_datetime
      fim = XPath.first(@doc, "//interacao/programa/programacao/fim").text.to_datetime
      programacao =  Programacao.find_or_create_by_inicio_and_fim_and_emissora_id(inicio, fim, emissora.id)
      
      @interacao.programa.programacoes << programacao if not @interacao.programa.programacoes.exists? programacao
      @interacao.programacao = programacao
      @interacao.stb = Stb.find_or_create_by_identifier(XPath.first(@doc, "//interacao/stb/identifier").text.to_s)
      
      XPath.each(@doc, "//interacao/programa/generos/genero") do |genero|
        genero_bd = Genero.find_or_create_by_nome(genero.text)
        @interacao.programa.generos << genero_bd if not @interacao.programa.generos.include?(genero_bd)
      end

      if not @interacao.programa.persisted?
        @interacao.programa.save
      end
      if @interacao.save
        render :text => "OK", :status => 202
      else
        render :text => @interacao.errors
      end
    end
  end

end
