require "rails_helper"

RSpec.describe AvaliacaoFestaController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/avaliacao_festa").to route_to("avaliacao_festa#index")
    end

    it "routes to #new" do
      expect(:get => "/avaliacao_festa/new").to route_to("avaliacao_festa#new")
    end

    it "routes to #show" do
      expect(:get => "/avaliacao_festa/1").to route_to("avaliacao_festa#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/avaliacao_festa/1/edit").to route_to("avaliacao_festa#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/avaliacao_festa").to route_to("avaliacao_festa#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/avaliacao_festa/1").to route_to("avaliacao_festa#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/avaliacao_festa/1").to route_to("avaliacao_festa#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/avaliacao_festa/1").to route_to("avaliacao_festa#destroy", :id => "1")
    end

  end
end
