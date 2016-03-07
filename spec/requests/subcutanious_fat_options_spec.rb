require 'rails_helper'

RSpec.describe "SubcutaniousFatOptions", type: :request do
  describe "GET /subcutanious_fat_options" do
    it "works! (now write some real specs)" do
      get subcutanious_fat_options_path
      expect(response).to have_http_status(200)
    end
  end
end
