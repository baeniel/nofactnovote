class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts do |t|
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
