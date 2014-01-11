require 'spec_helper'

describe SearchController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'tags'" do
    it "returns http success" do
      get 'tags'
      response.should be_success
    end
  end

  describe "GET 'category'" do
    it "returns http success" do
      get 'category'
      response.should be_success
    end
  end

end
