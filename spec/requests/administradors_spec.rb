require 'rails_helper'

RSpec.describe "Administradors", type: :request do
  describe "GET /administradors" do
    it "works! (now write some real specs)" do
      get administradors_path
      expect(response).to have_http_status(200)
    end
  end
end
