require "rails_helper"

RSpec.describe FestaController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/festa").to route_to("festa#index")
    end

    it "routes to #new" do
      expect(:get => "/festa/new").to route_to("festa#new")
    end

    it "routes to #show" do
      expect(:get => "/festa/1").to route_to("festa#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/festa/1/edit").to route_to("festa#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/festa").to route_to("festa#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/festa/1").to route_to("festa#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/festa/1").to route_to("festa#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/festa/1").to route_to("festa#destroy", :id => "1")
    end

  end
end
