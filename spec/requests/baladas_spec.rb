require 'rails_helper'

RSpec.describe "Baladas", type: :request do
  describe "GET /baladas" do
    it "works! (now write some real specs)" do
      get baladas_path
      expect(response).to have_http_status(200)
    end
  end
end
