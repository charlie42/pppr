class CreateDiagnoses < ActiveRecord::Migration
  def change
    create_table :diagnoses do |t|

      t.timestamps null: false
    end
  end
end
