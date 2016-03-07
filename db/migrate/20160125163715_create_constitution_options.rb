class CreateConstitutionOptions < ActiveRecord::Migration
  def change
    create_table :constitution_options do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
