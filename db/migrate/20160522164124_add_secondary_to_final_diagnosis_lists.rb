class AddSecondaryToFinalDiagnosisLists < ActiveRecord::Migration
  def change
    add_column :final_diagnosis_lists, :seconsary, :boolean
  end
end
