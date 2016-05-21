class AddIndexToDiagnoses < ActiveRecord::Migration
  def change
  	add_index :diagnoses, :name
  	add_index :medicines, :name
  end
end
