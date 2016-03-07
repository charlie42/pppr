require 'rails_helper'

describe Patient do
  # Your Examples Here

  it "patient is not valid without an name" do
    patient = Patient.new(name: nil)
    patient.should_not be_valid
  end

  it "patient is not valid without gender" do
    patient = Patient.new(gender: nil)
    patient.should_not be_valid
  end

  it "patient is not valid without age" do
    patient = Patient.new(age: nil)
    patient.should_not be_valid
  end

  it "patient is not valid with wrong gender" do
    patient = Patient.new(gender: "111")
    patient.should_not be_valid
  end

  it "patient is valid with right gender" do
    patient = Patient.new(gender: "1", name: "1", age: 6)
    patient.should be_valid
  end

end
