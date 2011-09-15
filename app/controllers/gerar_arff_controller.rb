class GerarArffController < ApplicationController
  def index
  end

  def gerar
    @interacoes = Interacao.all
  end

end
