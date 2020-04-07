class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :congress_name
      t.string :congress_party
      t.text :body

      t.timestamps
    end
  end
end
