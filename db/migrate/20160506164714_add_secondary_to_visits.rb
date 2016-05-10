class AddSecondaryToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :secondary, :boolean
  end
end
