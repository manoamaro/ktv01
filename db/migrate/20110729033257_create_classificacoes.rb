class CreateClassificacoes < ActiveRecord::Migration
  def self.up
    create_table :classificacoes do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :classificacoes
  end
end
