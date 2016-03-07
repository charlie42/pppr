require 'rails_helper'

describe Visit do
  # Your Examples Here

  it "visit is not valid without a visit_id" do
    visit = Visit.new(doctor_id: nil)
    visit.should_not be_valid
  end

  it "visit is not valid without a patient_id" do
    visit = Visit.new(patient_id: nil)
    visit.should_not be_valid
  end

end
