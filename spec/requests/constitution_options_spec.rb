require 'rails_helper'

RSpec.describe "ConstitutionOptions", type: :request do
  describe "GET /constitution_options" do
    it "works! (now write some real specs)" do
      get constitution_options_path
      expect(response).to have_http_status(200)
    end
  end
end
