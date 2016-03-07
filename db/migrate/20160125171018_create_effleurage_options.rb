class CreateEffleurageOptions < ActiveRecord::Migration
  def change
    create_table :effleurage_options do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
