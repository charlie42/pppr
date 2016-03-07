require 'rails_helper'

RSpec.describe "EffleurageOptions", type: :request do
  describe "GET /effleurage_options" do
    it "works! (now write some real specs)" do
      get effleurage_options_path
      expect(response).to have_http_status(200)
    end
  end
end
