class AddVisitIdDiagnosisIdDetailsToPrimaryDiagnosisVisits < ActiveRecord::Migration
  def change
  	add_column :primary_diagnosis_visits, :visit_id, :integer
  	add_column :primary_diagnosis_visits, :diagnosis_id, :integer
  	add_column :primary_diagnosis_visits, :details, :string
  end
end
