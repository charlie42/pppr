class DropMoreTables < ActiveRecord::Migration
  def up
    drop_table :consultation
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
