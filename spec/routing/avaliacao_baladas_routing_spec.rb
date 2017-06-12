require "rails_helper"

RSpec.describe AvaliacaoBaladasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/avaliacao_baladas").to route_to("avaliacao_baladas#index")
    end

    it "routes to #new" do
      expect(:get => "/avaliacao_baladas/new").to route_to("avaliacao_baladas#new")
    end

    it "routes to #show" do
      expect(:get => "/avaliacao_baladas/1").to route_to("avaliacao_baladas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/avaliacao_baladas/1/edit").to route_to("avaliacao_baladas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/avaliacao_baladas").to route_to("avaliacao_baladas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/avaliacao_baladas/1").to route_to("avaliacao_baladas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/avaliacao_baladas/1").to route_to("avaliacao_baladas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/avaliacao_baladas/1").to route_to("avaliacao_baladas#destroy", :id => "1")
    end

  end
end
