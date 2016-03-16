require 'rails_helper'

RSpec.describe "Examinations", type: :request do
  describe "GET /examinations" do
    it "works! (now write some real specs)" do
      get examinations_path
      expect(response).to have_http_status(200)
    end
  end
end
