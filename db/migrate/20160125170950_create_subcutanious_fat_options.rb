class CreateSubcutaniousFatOptions < ActiveRecord::Migration
  def change
    create_table :subcutanious_fat_options do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
