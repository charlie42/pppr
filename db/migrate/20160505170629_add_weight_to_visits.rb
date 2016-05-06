class AddWeightToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :weight, :string
  end
end
