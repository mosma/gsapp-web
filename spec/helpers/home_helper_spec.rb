require 'spec_helper'

describe HomeHelper do
  describe "GET/POST 'facebook'" do
    it "creates a new user" do
      post :facebook
      response.should be_success
    end
    it "logs user in" do
      post :facebook
      response.should be_success
    end
    it "links user's account" do
      post :facebook
      response.should be_success
    end
  end
  describe "GET/POST 'linkedin'" do
    it "returns http success" do
      post :linkedin
      response.should be_success
    end
    it "logs user in" do
      post :linkedin
      response.should be_success
    end
    it "links user's account" do
      post :linkedin
      response.should be_success
    end
  end
  describe "GET/POST 'instagram'" do
    it "returns http success" do
      post :instagram
      response.should be_success
    end
    it "logs user in" do
      post :instagram
      response.should be_success
    end
    it "links user's account" do
      post :instagram
      response.should be_success
    end
  end
  describe "GET/POST 'google_oauth2'" do
    it "returns http success" do
      post :google_oauth2
      response.should be_success
    end
    it "logs user in" do
      post :google_oauth2
      response.should be_success
    end
    it "links user's account" do
      post :google_oauth2
      response.should be_success
    end
  end
  describe "GET/POST 'github'" do
    it "returns http success" do
      post :github
      response.should be_success
    end
    it "logs user in" do
      post :github
      response.should be_success
    end
    it "links user's account" do
      post :github
      response.should be_success
    end
  end
end
