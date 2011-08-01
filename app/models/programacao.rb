class Programacao < ActiveRecord::Base
  belongs_to :emissora
  belongs_to :programa
end
