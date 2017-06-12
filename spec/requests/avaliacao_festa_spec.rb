require 'rails_helper'

RSpec.describe "AvaliacaoFesta", type: :request do
  describe "GET /avaliacao_festa" do
    it "works! (now write some real specs)" do
      get avaliacao_festa_path
      expect(response).to have_http_status(200)
    end
  end
end
