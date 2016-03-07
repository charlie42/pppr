class AddPatientToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :patient, index: true, foreign_key: true
  end
end
