require "rails_helper"

RSpec.describe LobbiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lobbies").to route_to("lobbies#index")
    end

    it "routes to #new" do
      expect(get: "/lobbies/new").to route_to("lobbies#new")
    end

    it "routes to #show" do
      expect(get: "/lobbies/1").to route_to("lobbies#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lobbies/1/edit").to route_to("lobbies#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lobbies").to route_to("lobbies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lobbies/1").to route_to("lobbies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lobbies/1").to route_to("lobbies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lobbies/1").to route_to("lobbies#destroy", id: "1")
    end
  end
end
