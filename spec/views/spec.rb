require 'rails_helper'

describe "doctor/show", :type => :view do

  it "displays " do
    assign(:doctor, Doctor.new(:name => "Иванов Иван"))
    render
    expect(rendered).to include("Иванов Иван")
  end

end