class AddHeadlinesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :head1, :string
    add_column :users, :head2, :string
    add_column :users, :head3, :string
    add_column :users, :head4, :string
    add_column :users, :small_district, :string
  end
end
