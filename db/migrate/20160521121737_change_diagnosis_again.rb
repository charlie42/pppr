class ChangeDiagnosisAgain < ActiveRecord::Migration
  def change
  	add_column :diagnoses, :code, :string
  end
end
