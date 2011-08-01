class CreateInteracoes < ActiveRecord::Migration
  def self.up
    create_table :interacoes do |t|
      t.integer :tempo
      t.datetime :data
      t.references :emissora
      t.references :programa
      t.references :stb

      t.timestamps
    end
  end

  def self.down
    drop_table :interacoes
  end
end
