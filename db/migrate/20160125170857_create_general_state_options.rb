class CreateGeneralStateOptions < ActiveRecord::Migration
  def change
    create_table :general_state_options do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
