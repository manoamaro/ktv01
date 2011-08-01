class CreateGenerosProgramas < ActiveRecord::Migration
  def self.up
    create_table :generos_programas, :id => false do |t|
      t.references :programa
      t.references :genero
    end
  end

  def self.down
    drop_table :generos_programas
  end
end
