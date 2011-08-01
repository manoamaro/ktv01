class RemoveInicioAndFimFromProgramas < ActiveRecord::Migration
  def self.up
    remove_column :programas, :inicio
    remove_column :programas, :fim
  end

  def self.down
    add_column :programas, :inicio
    add_column :programas, :fim
  end
end
