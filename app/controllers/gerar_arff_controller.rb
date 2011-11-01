class GerarArffController < ApplicationController
  def index
  end

  def gerar
    select = <<-END_OF_STRING
      SELECT 
      #{gerar_selects}
      FROM interacoes
      JOIN programas on programas.id = interacoes.id
      JOIN stbs on stbs.id = interacoes.id
      JOIN programacoes on programacoes.id = interacoes.id
      JOIN emissoras on emissoras.id = programacoes.emissora_id
      JOIN generos_programas on generos_programas.programa_id = programas.id
      JOIN generos on generos.id = generos_programas.genero_id
    END_OF_STRING
    @result = ActiveRecord::Base.connection.execute(select)
    
    @result = Array.new
    
    Interacao.all.each do |interacao|
      r = Array.new
      params[:interacao].each do |p|
        r << interacao[p]
      end
      params[:programa].each do |p|
        r << interacao.programa[p]
      end
      @result << r
    end
    
    dir = Rails.root.to_s + "/lib/"
    Rjb::load(dir+"mysql-connector.jar:"+dir+"weka.jar", jvmargs=["-Xmx1000M"])
    query = Rjb::import("weka.experiment.InstanceQuery").new
    query.setUsername("root")
    query.setPassword("dharma")
    query.setQuery(select)
#    data = query.retrieveInstances
#    kmeans = Rjb::import("weka.clusterers.SimpleKMeans").new
#    kmeans.buildClusterer(data)
    respond_to do |format|
      format.html
      format.arff
    end
  end

  def gerar_selects()
    select = Array.new
    select << gerar_select('interacoes',params[:interacao])
    select << gerar_select('programas',params[:programa])
    select << gerar_select('emissoras',params[:emissora])
    select << gerar_select('generos',params[:genero])
    select << gerar_select('stbs',params[:stb])
    select.delete_if do |i| 
      i.nil? 
    end.join(',')
  end

  def gerar_select(nome,param)
    return nil if param.nil?
    s = Array.new
    param.each do |p|
      s << "#{nome}.#{p}"
    end
    s.join(',')
  end

end
