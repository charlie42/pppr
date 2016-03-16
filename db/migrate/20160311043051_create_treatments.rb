class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.references :factor, index: true, foreign_key: true
      t.integer :amount
      t.string :details
      t.references :visit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
