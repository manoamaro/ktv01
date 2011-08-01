class RemoveEmissoraFromProgramacaoAndAddProgramacaoToInteracao < ActiveRecord::Migration
  def self.up
     remove_column :interacoes, :emissora_id
     add_column :interacoes, :programacao_id, :integer
  end

  def self.down
     add_column :interacoes, :emissora_id, :integer
     remove_column :interacoes, :programacao_id
  end
end
