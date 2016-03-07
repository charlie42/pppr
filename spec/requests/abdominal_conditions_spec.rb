require 'rails_helper'

RSpec.describe "AbdominalConditions", type: :request do
  describe "GET /abdominal_conditions" do
    it "works! (now write some real specs)" do
      get abdominal_conditions_path
      expect(response).to have_http_status(200)
    end
  end
end
