class CreateEmissoras < ActiveRecord::Migration
  def self.up
    create_table :emissoras do |t|
      t.string :nome
      t.integer :canal

      t.timestamps
    end
  end

  def self.down
    drop_table :emissoras
  end
end
