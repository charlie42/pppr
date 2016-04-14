class CreateFinalDiagnosisLists < ActiveRecord::Migration
  def change
    create_table :final_diagnosis_lists do |t|
      t.references :diagnosis, index: true, foreign_key: true
      t.references :patient, index: true, foreign_key: true
      t.references :doctor, index: true, foreign_key: true
      t.boolean :diagnosis_time

      t.timestamps null: false
    end
  end
end
