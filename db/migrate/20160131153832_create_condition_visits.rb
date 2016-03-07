class CreateConditionVisits < ActiveRecord::Migration
  def change
    create_table :condition_visits do |t|
      t.references :visit
      t.references :condition_type
      t.references :condition_name
      t.references :condition_value
      t.string :details

      t.timestamps null: false
    end
  end
end
