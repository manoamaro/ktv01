class Interacao < ActiveRecord::Base
  belongs_to :programa
  belongs_to :stb
  belongs_to :programacao
end
