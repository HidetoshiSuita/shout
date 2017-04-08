require "rails_helper"

RSpec.describe HashTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hash_tags").to route_to("hash_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/hash_tags/new").to route_to("hash_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/hash_tags/1").to route_to("hash_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hash_tags/1/edit").to route_to("hash_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hash_tags").to route_to("hash_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hash_tags/1").to route_to("hash_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hash_tags/1").to route_to("hash_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hash_tags/1").to route_to("hash_tags#destroy", :id => "1")
    end

  end
end
