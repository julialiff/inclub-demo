require "rails_helper"

RSpec.describe AdministradorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/administradors").to route_to("administradors#index")
    end

    it "routes to #new" do
      expect(:get => "/administradors/new").to route_to("administradors#new")
    end

    it "routes to #show" do
      expect(:get => "/administradors/1").to route_to("administradors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/administradors/1/edit").to route_to("administradors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/administradors").to route_to("administradors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/administradors/1").to route_to("administradors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/administradors/1").to route_to("administradors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/administradors/1").to route_to("administradors#destroy", :id => "1")
    end

  end
end
