require 'spec_helper'
include Devise::TestHelpers

describe Users::OmniauthCallbacksController do
  describe "GET/POST 'facebook'" do
    it "creates a new user" do
      request.env.merge! stub_env_for :facebook
      post :facebook
      response.should be_success
    end
    it "logs user in" do
      request.env.merge! stub_env_for :facebook
      post :facebook
      response.should be_success
    end
    it "links user's account" do
      request.env.merge! stub_env_for :facebook
      post :facebook
      response.should be_success
    end
  end
  describe "GET/POST 'linkedin'" do
    it "returns http success" do
      request.env.merge! stub_env_for :linkedin
      post :linkedin
      response.should be_success
    end
    it "logs user in" do
      request.env.merge! stub_env_for :linkedin
      post :linkedin
      response.should be_success
    end
    it "links user's account" do
      request.env.merge! stub_env_for :linkedin
      post :linkedin
      response.should be_success
    end
  end
  describe "GET/POST 'instagram'" do
    it "returns http success" do
      request.env.merge! stub_env_for :instagram
      post :instagram
      response.should be_success
    end
    it "logs user in" do
      request.env.merge! stub_env_for :instagram
      post :instagram
      response.should be_success
    end
    it "links user's account" do
      request.env.merge! stub_env_for :instagram
      post :instagram
      response.should be_success
    end
  end
  describe "GET/POST 'google_oauth2'" do
    it "returns http success" do
      request.env.merge! stub_env_for :google_oauth2
      post :google_oauth2
      response.should be_success
    end
    it "logs user in" do
      request.env.merge! stub_env_for :google_oauth2
      post :google_oauth2
      response.should be_success
    end
    it "links user's account" do
      request.env.merge! stub_env_for :google_oauth2
      post :google_oauth2
      response.should be_success
    end
  end
  describe "GET/POST 'github'" do
    it "returns http success" do
      request.env.merge! stub_env_for :github
      post :github
      response.should be_success
    end
    it "logs user in" do
      request.env.merge! stub_env_for :github
      post :github
      response.should be_success
    end
    it "links user's account" do
      request.env.merge! stub_env_for :github
      post :github
      response.should be_success
    end
  end

end
