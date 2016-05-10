class CreateAnamnesisNames < ActiveRecord::Migration
  def change
    create_table :anamnesis_names do |t|
      t.string :name
      t.references :condition_type, index: true, foreign_key: true
      t.boolean :unique
    end
  end
end
