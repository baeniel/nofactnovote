class DropAhoyVisitis < ActiveRecord::Migration[6.0]
  def change
    drop_table :ahoy_visits
  end
end
