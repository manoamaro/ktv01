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
      @result << r
    end

    path = "#{Rails.root}/tmp/output.arff"
    file = File.new(path, 'w')
    file.puts render_to_string 'gerar', :format => :arff
    file.close
    
    dir = Rails.root.to_s + "/lib/"
    Rjb::load(dir+"mysql-connector.jar:"+dir+"weka.jar", jvmargs=["-Xmx1000M"])
    obj = Rjb::import("weka.associations.Apriori")
    kmeans = obj.new
    labor_src = Rjb::import("java.io.FileReader").new(path)
    labor_data = Rjb::import("weka.core.Instances").new(labor_src)
    kmeans.buildAssociations(labor_data)
    
    render :text =>  kmeans.toString
  end
end
