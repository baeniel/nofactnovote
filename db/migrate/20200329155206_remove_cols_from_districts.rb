class RemoveColsFromDistricts < ActiveRecord::Migration[6.0]
  def change
    remove_column :districts, :lat, :decimal
    remove_column :districts, :lng, :decimal
  end
end
