class AddEffleurageToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :effleurage_option, index: true, foreign_key: true
  end
end
