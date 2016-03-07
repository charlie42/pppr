require 'rails_helper'

describe "doctors/show", :type => :view do

  it "displays name correctly" do
    assign(:doctor, Doctor.new(:name => "Иванов Иван"))
    render
    expect(rendered).to include("Иванов Иван")
  end

end