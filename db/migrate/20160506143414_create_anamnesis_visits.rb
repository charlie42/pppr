class CreateAnamnesisVisits < ActiveRecord::Migration
  def change
    create_table :anamnesis_visits do |t|
      t.references :visit, index: true, foreign_key: true
      t.references :condition_value, index: true, foreign_key: true
    end
  end
end
