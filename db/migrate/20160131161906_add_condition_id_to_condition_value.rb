class AddConditionIdToConditionValue < ActiveRecord::Migration
  def change
    add_reference :condition_values, :condition_name, index: true, foreign_key: true
  end
end
