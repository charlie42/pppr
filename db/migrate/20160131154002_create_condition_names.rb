class CreateConditionNames < ActiveRecord::Migration
  def change
    create_table :condition_names do |t|
      t.string :name
      t.references :condition_type
      t.boolean :unique

      t.timestamps null: false
    end
  end
end
