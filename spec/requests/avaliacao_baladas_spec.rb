require 'rails_helper'

RSpec.describe "AvaliacaoBaladas", type: :request do
  describe "GET /avaliacao_baladas" do
    it "works! (now write some real specs)" do
      get avaliacao_baladas_path
      expect(response).to have_http_status(200)
    end
  end
end
