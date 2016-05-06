class AddTempToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :temp, :string
  end
end
