require 'rails_helper'

RSpec.describe "GeneralStateOptions", type: :request do
  describe "GET /general_state_options" do
    it "works! (now write some real specs)" do
      get general_state_options_path
      expect(response).to have_http_status(200)
    end
  end
end
