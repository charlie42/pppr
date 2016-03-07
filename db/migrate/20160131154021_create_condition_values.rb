class CreateConditionValues < ActiveRecord::Migration
  def change
    create_table :condition_values do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
