class CreateJoinTableVisitAbdominalCondition < ActiveRecord::Migration
  def change
    create_join_table :visits, :abdominal_conditions do |t|
      # t.index [:visit_id, :abdominal_condition_id]
      # t.index [:abdominal_condition_id, :visit_id]
    end
  end
end
