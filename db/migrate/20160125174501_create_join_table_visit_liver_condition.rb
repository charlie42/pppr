class CreateJoinTableVisitLiverCondition < ActiveRecord::Migration
  def change
    create_join_table :visits, :liver_conditions do |t|
      # t.index [:visit_id, :liver_condition_id]
      # t.index [:liver_condition_id, :visit_id]
    end
  end
end
