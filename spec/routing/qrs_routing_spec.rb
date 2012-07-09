require "spec_helper"

describe QrsController do
  describe "routing" do

    it "routes to #index" do
      get("/qrs").should route_to("qrs#index")
    end

    it "routes to #new" do
      get("/qrs/new").should route_to("qrs#new")
    end

    it "routes to #show" do
      get("/qrs/1").should route_to("qrs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/qrs/1/edit").should route_to("qrs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/qrs").should route_to("qrs#create")
    end

    it "routes to #update" do
      put("/qrs/1").should route_to("qrs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/qrs/1").should route_to("qrs#destroy", :id => "1")
    end

  end
end
