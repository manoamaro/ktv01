class Programa < ActiveRecord::Base
  belongs_to :classificacao
  has_and_belongs_to_many :generos
  has_many :programacoes
end
