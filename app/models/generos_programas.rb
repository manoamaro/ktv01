class GenerosProgramas < ActiveRecord::Base
  belongs_to :programa
  belongs_to :genero
end
