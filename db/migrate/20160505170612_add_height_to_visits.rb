class AddHeightToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :height, :string
  end
end
