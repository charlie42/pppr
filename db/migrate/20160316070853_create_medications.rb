class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.references :medicine, index: true, foreign_key: true
      t.string :duration
      t.integer :dosage
      t.string :details
      t.references :visit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
