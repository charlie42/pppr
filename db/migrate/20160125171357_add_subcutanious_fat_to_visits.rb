class AddSubcutaniousFatToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :subcutanious_fat_option, index: true, foreign_key: true
  end
end
