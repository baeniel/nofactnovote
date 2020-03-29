class AddPolicyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :policy, :string
  end
end
