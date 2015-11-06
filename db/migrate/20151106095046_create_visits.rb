class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :from
      t.date :created_at
      t.string :complaints
      t.string :anamnesis
      t.string :allerg
      t.string :general_state
      t.string :diagnosis

      t.timestamps null: false
    end
  end
end
