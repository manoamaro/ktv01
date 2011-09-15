class GerarArffController < ApplicationController
  def index
  end

  def gerar
    select = <<-END_OF_STRING
      SELECT 
        #{gerar_select('interacoes',params[:interacao])},
        #{gerar_select('programas',params[:programa])},
        #{gerar_select('emissoras',params[:emissora])},
        #{gerar_select('generos',params[:genero])}
      FROM interacoes
      JOIN programas on programas.id = interacoes.id
      JOIN stbs on stbs.id = interacoes.id
      JOIN programacoes on programacoes.id = interacoes.id
      JOIN emissoras on emissoras.id = programacoes.emissora_id
      JOIN generos_programas on generos_programas.programa_id = programas.id
      JOIN generos on generos.id = generos_programas.genero_id
    END_OF_STRING
    @result = ActiveRecord::Base.connection.execute(select)
  end

  def gerar_select(nome,param)
    s = s || String.new
    if param.nil? 
      return s
    end
    param.each do |p|
      s = s + "#{nome}.#{p},"
    end
    s[0..-2]
  end

end
