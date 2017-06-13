require 'rails_helper'

RSpec.describe "Festa", type: :request do
  describe "GET /festa" do
    it "works! (now write some real specs)" do
      get festa_path
      expect(response).to have_http_status(200)
    end
  end
end
