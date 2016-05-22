class AddDoctorToDispanserisation < ActiveRecord::Migration
  def change
    add_reference :dispanserisations, :doctor, index: true, foreign_key: true
  end
end
