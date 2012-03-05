class MinerarController < ApplicationController
  def index
  end
  
  def minerar

    @result = Array.new
    @campos = Hash.new
    
    Interacao.all.each do |interacao|
      r = Array.new
      
      params[:interacao].each do |p|
        r << interacao[p]
        @campos["interacao_#{p}"] = interacao[p].class.name
      end if params[:interacao].present?

      params[:programa].each do |p|
        r << interacao.programa[p]
        @campos["programa_#{p}"] = interacao.programa[p].class.name
      end if params[:programa].present?

      params[:emissora].each do |p|
        r << interacao.programacao.emissora[p]
        @campos["emissora_#{p}"] = interacao.programacao.emissora[p].class.name
      end if params[:emissora].present?

      params[:genero].each do |p|
        r << interacao.programa.generos[0][p]
        @campos["genero_#{p}"] = interacao.programa.generos[0][p].class.name
      end if params[:genero].present?

      params[:stb].each do |p|
        r << interacao.stb[p]
        @campos["stb_#{p}"] = interacao.stb[p].class.name
      end if params[:stb].present?
      @result << r
      
    end

    path_src = "#{Rails.root}/tmp/src.arff"
    path_out = "#{Rails.root}/tmp/output.txt"
    file = File.new(path_src, 'w')
    file.puts render_to_string 'gerar', :format => :arff
    file.close
    
    system "java -jar #{Rails.root}/lib/MiningProcess.jar \"#{path_src}\" \"#{path_out}\""

  end

end
