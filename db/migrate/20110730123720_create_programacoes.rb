class CreateProgramacoes < ActiveRecord::Migration
  def self.up
    create_table :programacoes do |t|
      t.datetime :inicio
      t.datetime :fim
      t.references :emissora
      t.references :programa

      t.timestamps
    end
  end

  def self.down
    drop_table :programacoes
  end
end
