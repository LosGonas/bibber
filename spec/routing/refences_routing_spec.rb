require "spec_helper"

describe RefencesController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/refences").to route_to("refences#index")
    end

    it "routes to #new" do
      expect(:get => "/refences/new").to route_to("refences#new")
    end

    it "routes to #show" do
      expect(:get => "/refences/1").to route_to("refences#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/refences/1/edit").to route_to("refences#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/refences").to route_to("refences#create")
    end

    it "routes to #update" do
      expect(:put => "/refences/1").to route_to("refences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/refences/1").to route_to("refences#destroy", :id => "1")
    end

  end
end
