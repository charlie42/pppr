class AddBoolTestToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :bool_test, :boolean
  end
end
