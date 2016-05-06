class AddNextToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :next, :datetime
  end
end
