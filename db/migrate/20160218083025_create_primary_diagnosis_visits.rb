class CreatePrimaryDiagnosisVisits < ActiveRecord::Migration
  def change
    create_table :primary_diagnosis_visits do |t|
      t.references :diagnosis
      t.references :visit
      t.string :details

      t.timestamps null: false
    end
  end
end
