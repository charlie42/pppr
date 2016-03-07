require 'rails_helper'

describe "patients/show", :type => :view do

  it "displays name correctly" do
    assign(:patient, Patient.new(:name => "Пациент Паицентович"))
    render
    expect(rendered).to include("Пациент Паицентович")
  end

end