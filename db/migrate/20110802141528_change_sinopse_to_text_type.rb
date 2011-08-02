class ChangeSinopseToTextType < ActiveRecord::Migration
  def self.up
    change_column(:programas, :sinopse, :text)
  end

  def self.down
    change_column(:programas, :sinopse, :string)
  end
end
