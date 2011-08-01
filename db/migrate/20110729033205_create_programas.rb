class CreateProgramas < ActiveRecord::Migration
  def self.up
    create_table :programas do |t|
      t.string :nome
      t.string :sinopse
      t.integer :duracao
      t.datetime :inicio
      t.datetime :fim
      t.references :classificacao

      t.timestamps
    end
  end

  def self.down
    drop_table :programas
  end
end
