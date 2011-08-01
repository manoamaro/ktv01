class CreateStbs < ActiveRecord::Migration
  def self.up
    create_table :stbs do |t|
      t.string :identifier

      t.timestamps
    end
  end

  def self.down
    drop_table :stbs
  end
end
