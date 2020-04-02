class AddLinksToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :link1, :string
    add_column :users, :link2, :string
    add_column :users, :link3, :string
    add_column :users, :link4, :string
  end
end
