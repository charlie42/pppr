class AddPatientToDispanserisation < ActiveRecord::Migration
  def change
    add_reference :dispanserisations, :patient, index: true, foreign_key: true
  end
end
