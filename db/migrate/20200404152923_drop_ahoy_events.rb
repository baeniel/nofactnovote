class DropAhoyEvents < ActiveRecord::Migration[6.0]
  def up
    drop_table :ahoy_events, :ahoy_visits
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
