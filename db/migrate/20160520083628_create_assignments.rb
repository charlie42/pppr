class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :role
      t.references :doctor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
