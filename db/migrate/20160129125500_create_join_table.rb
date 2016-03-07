class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :visits, :specialists, table_name: :consultations do |t|
      # t.index [:visit_id, :consultation_id]
      # t.index [:consultation_id, :visit_id]
      t.string :result
    end
  end
end
