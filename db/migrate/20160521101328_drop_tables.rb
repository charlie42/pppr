class DropTables < ActiveRecord::Migration
  def up
    drop_table :abdominal_condition_visits
    drop_table :abdominal_conditions
    drop_table :abdominal_conditions_visits
    drop_table :effleurage_options
    drop_table :liver_condition_visits
    drop_table :liver_conditions_visits
    drop_table :liver_conditions
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
