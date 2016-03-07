require 'rails_helper'

RSpec.describe "LiverConditions", type: :request do
  describe "GET /liver_conditions" do
    it "works! (now write some real specs)" do
      get liver_conditions_path
      expect(response).to have_http_status(200)
    end
  end
end
