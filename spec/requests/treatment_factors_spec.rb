require 'rails_helper'

RSpec.describe "TreatmentFactors", type: :request do
  describe "GET /treatment_factors" do
    it "works! (now write some real specs)" do
      get treatment_factors_path
      expect(response).to have_http_status(200)
    end
  end
end
