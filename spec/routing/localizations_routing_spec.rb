require "spec_helper"

describe LocalizationsController do
  describe "routing" do

    it "routes to #index" do
      get("/localizations").should route_to("localizations#index")
    end

    it "routes to #new" do
      get("/localizations/new").should route_to("localizations#new")
    end

    it "routes to #show" do
      get("/localizations/1").should route_to("localizations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/localizations/1/edit").should route_to("localizations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/localizations").should route_to("localizations#create")
    end

    it "routes to #update" do
      put("/localizations/1").should route_to("localizations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/localizations/1").should route_to("localizations#destroy", :id => "1")
    end

  end
end
