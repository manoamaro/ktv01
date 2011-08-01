require 'rexml/document'
include REXML

class EnvioxmlController < ApplicationController
  
  def index
    
  end

  def enviar
    @doc = Document.new(params[:xml])
    @interacao = Interacao.new
    @interacao.data = XPath.first(@doc, "//interacao/data").text.to_datetime
    @interacao.tempo = XPath.first(@doc, "//interacao/tempo").text.to_i
    
    @interacao.programa = Programa.find_or_initialize_by_nome(XPath.first(@doc, "//interacao/programa/nome").text.to_s)
    @interacao.programa.sinopse = XPath.first(@doc, "//interacao/programa/sinopse").text.to_s
    @interacao.programa.duracao = XPath.first(@doc, "//interacao/programa/duracao").text.to_i
    
    emissora = Emissora.find_or_create_by_nome_and_canal(XPath.first(@doc, "//interacao/programa/programacao/emissora/nome").text.to_s, XPath.first(@doc, "//interacao/programa/programacao/emissora/canal").text.to_i)
    inicio = XPath.first(@doc, "//interacao/programa/programacao/inicio").text.to_datetime
    fim = XPath.first(@doc, "//interacao/programa/programacao/fim").text.to_datetime
    programacao =  Programacao.find_or_create_by_inicio_and_fim_and_emissora_id(inicio, fim, emissora.id)
    
    @interacao.programa.programacoes << programacao if not @interacao.programa.programacoes.exists? programacao
    @interacao.programacao = programacao
    @interacao.stb = Stb.find_or_create_by_identifier(XPath.first(@doc, "//interacao/stb/identifier").text.to_s)
    
    XPath.each(@doc, "//interacao/programa/generos/genero") do |genero|
      @interacao.programa.generos << Genero.find_or_create_by_nome(genero.text)
    end

    if not @interacao.programa.persisted?
      @interacao.programa.save
    end

    @interacao.save
    
  end

end
