require 'rails_helper'

describe "visits/show", :type => :view do

  it "displays diagnosis correctly" do
    assign(:visit, Visit.new(:diagnosis => "Волчанка"))
    render
    expect(rendered).to include("Волчанка")
  end

  # it "displays from what doctor the patient came from correctly" do
  #   assign(:visit, Visit.new(:from => "Терапевт"))
  #   render
  #   expect(rendered).to include("Не терапевт")
  # end

end