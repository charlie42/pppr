class AddNameToDiagnosis < ActiveRecord::Migration
  def change
    add_column :diagnoses, :name, :string
  end
end
