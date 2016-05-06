class AddAnMorbiToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :an_morbi, :string
  end
end
