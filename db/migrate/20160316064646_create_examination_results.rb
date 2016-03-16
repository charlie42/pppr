class CreateExaminationResults < ActiveRecord::Migration
  def change
    create_table :examination_results do |t|
      t.references :examination, index: true, foreign_key: true
      t.string :result
      t.string :details
      t.references :visit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
