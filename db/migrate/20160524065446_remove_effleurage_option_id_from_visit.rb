class RemoveEffleurageOptionIdFromVisit < ActiveRecord::Migration
  def change
    remove_column :visits, :effleurage_option_id
  end
end
