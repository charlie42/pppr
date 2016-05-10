class AddBoolTestToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :bool_test, :boolean
  end
end
