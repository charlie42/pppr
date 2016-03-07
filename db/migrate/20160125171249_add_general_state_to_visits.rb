class AddGeneralStateToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :general_state_option, index: true, foreign_key: true
  end
end
