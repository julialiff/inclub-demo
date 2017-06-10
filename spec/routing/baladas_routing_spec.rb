require "rails_helper"

RSpec.describe BaladasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/baladas").to route_to("baladas#index")
    end

    it "routes to #new" do
      expect(:get => "/baladas/new").to route_to("baladas#new")
    end

    it "routes to #show" do
      expect(:get => "/baladas/1").to route_to("baladas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/baladas/1/edit").to route_to("baladas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/baladas").to route_to("baladas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/baladas/1").to route_to("baladas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/baladas/1").to route_to("baladas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/baladas/1").to route_to("baladas#destroy", :id => "1")
    end

  end
end
