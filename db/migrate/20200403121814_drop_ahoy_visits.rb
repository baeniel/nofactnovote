class DropAhoyVisits < ActiveRecord::Migration[6.0]
  def up
    drop_table :ahoy_visits, :ahoy_events
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
