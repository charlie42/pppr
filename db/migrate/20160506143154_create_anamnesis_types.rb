class CreateAnamnesisTypes < ActiveRecord::Migration
  def change
    create_table :anamnesis_types do |t|
      t.string :name
    end
  end
end
