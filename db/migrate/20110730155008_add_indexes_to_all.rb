class AddIndexesToAll < ActiveRecord::Migration
  def self.up
    add_index :programas, :nome
    add_index :generos, :nome
    add_index :emissoras, :nome
    add_index :emissoras, :canal
    add_index :programacoes, :inicio
    add_index :programacoes, :fim
    add_index :stbs, :identifier
  end

  def self.down
    remove_index :programas, :nome
    remove_index :generos, :nome
    remove_index :emissoras, :nome
    remove_index :emissoras, :canal
    remove_index :programacoes, :inicio
    remove_index :programacoes, :fim
    remove_index :stbs, :identifier
  end
end
