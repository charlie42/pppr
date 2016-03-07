class AddConstitutionToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :constitution_option, index: true, foreign_key: true
  end
end
