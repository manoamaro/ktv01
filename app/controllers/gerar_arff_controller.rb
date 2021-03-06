class GerarArffController < ApplicationController
  
  def index
  end

  def gerar
    @result = Array.new
    @campos = Hash.new
    
    Interacao.all.each do |interacao|
      r = Array.new
      
      params[:interacao].each do |p|
        r << interacao[p]
        @campos["interacao_#{p}"] = "{#{Interacao.select("distinct #{p}").collect {|i| "\"#{i[p]}\""}.join(',')}}"
      end if params[:interacao].present?

      params[:programa].each do |p|
        r << interacao.programa[p]
        @campos["programa_#{p}"] = "{#{Programa.select("distinct #{p}").collect {|i| "\"#{i[p]}\""}.join(',')}}"
      end if params[:programa].present?

      params[:emissora].each do |p|
        r << interacao.programacao.emissora[p]
        @campos["emissora_#{p}"] = "{#{Emissora.select("distinct #{p}").collect {|i| "\"#{i[p]}\""}.join(',')}}"
      end if params[:emissora].present?

      params[:genero].each do |p|
        r << interacao.programa.generos[0][p]
        @campos["genero_#{p}"] = "{#{Genero.select("distinct #{p}").collect {|i| "\"#{i[p]}\""}.join(',')}}"
      end if params[:genero].present?

      params[:stb].each do |p|
        r << interacao.stb[p]
        @campos["stb_#{p}"] = "{#{Stb.select("distinct #{p}").collect {|i| "\"#{i[p]}\""}.join(',')}}"
      end if params[:stb].present?
      @result << r
    end
    render
  end
end
