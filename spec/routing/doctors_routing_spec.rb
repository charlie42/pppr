require 'rails_helper'

RSpec.describe "routing to doctors", :type => :routing do
  it "routes /doctor/:id to doctor#show for id" do
    expect(:get => "/doctors/1").to route_to(
      :controller => "doctors",
      :action => "show",
      :id => "1"
    )
  end

  it "routes /doctor/:id/patients to patient#index for id" do
    expect(:get => "/doctors/1/patients").to route_to(
      :controller => "patients",
      :action => "index",
      :doctor_id => "1"
    )
  end

  it "routes /doctor/:id/patient/:id to patient#show for id" do
    expect(:get => "/doctors/1/patients/1").to route_to(
      :controller => "patients",
      :action => "show",
      :doctor_id => "1",
      :id => "1"
    )
  end

  it "routes /doctor/:id/patient/:id/visit/:id to patient#show for id" do
    expect(:get => "/doctors/1/patients/1/visits/1").to route_to(
      :controller => "visits",
      :action => "show",
      :doctor_id => "1",
      :patient_id => "1",
      :id => "1"
    )
  end  

  it "routes /doctor/:id/patient/:id/visits to visit#index for id" do
    expect(:get => "/doctors/1/patients/1/visits").to route_to(
      :controller => "visits",
      :action => "index",
      :doctor_id => "1",
      :patient_id => "1"
    )
  end

end

