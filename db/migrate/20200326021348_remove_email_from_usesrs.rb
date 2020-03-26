class RemoveEmailFromUsesrs < ActiveRecord::Migration[6.0]
  def self.up
    remove_column :users, :email
  end

  def self.down
    add_column :users, :email
  end
end
