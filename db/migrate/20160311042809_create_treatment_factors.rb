class CreateTreatmentFactors < ActiveRecord::Migration
  def change
    create_table :treatment_factors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
