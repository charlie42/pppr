class CreateAnamnesisValues < ActiveRecord::Migration
  def change
    create_table :anamnesis_values do |t|
      t.string :name
      t.references :condition_name, index: true, foreign_key: true
    end
  end
end
