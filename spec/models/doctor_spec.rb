require 'rails_helper'

describe Doctor do
  # Your Examples Here

	it "doctor is not valid without an email" do
	  doctor = Doctor.new(email: nil, password: "11111111")
	  doctor.should_not be_valid
	end

	it "doctor is not valid without a password" do
	  doctor = Doctor.new(email: "1@1.1", password: nil)
	  doctor.should_not be_valid
	end

	it "doctor is not valid with a short password" do
	  doctor = Doctor.new(email: "1@1.1", password: "11")
	  doctor.should_not be_valid
	end

	it "doctor is valid with a long password" do
	  doctor = Doctor.new(email: "1@1.1", password: "11111111")
	  doctor.should be_valid
	end

end
