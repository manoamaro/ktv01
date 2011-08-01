class Genero < ActiveRecord::Base
  has_and_belongs_to_many :programas
end
