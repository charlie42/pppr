class ChangeDiagnosis < ActiveRecord::Migration
  def change
  	add_column :diagnoses, :group, :string
	add_column :diagnoses, :block, :string
  end
end
