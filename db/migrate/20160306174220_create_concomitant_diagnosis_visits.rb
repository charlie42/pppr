class CreateConcomitantDiagnosisVisits < ActiveRecord::Migration
  def change
    create_table :concomitant_diagnosis_visits do |t|
    	t.references :diagnosis
        t.references :visit
        t.string :details
    end
  end
end
