require "rails_helper"

RSpec.describe FriendsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/friends").to route_to("friends#index")
    end

    it "routes to #show" do
      expect(get: "/friends/1").to route_to("friends#show", id: "1")
    end
  end
end
