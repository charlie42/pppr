class AddAllergyToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :allergy, :string
  end
end
