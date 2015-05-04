require "rails_helper"

RSpec.describe MusicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/musics").to route_to("musics#index")
    end

    it "routes to #show" do
      expect(:get => "/musics/1").to route_to("musics#show", :id => "1")
    end
  end
end
