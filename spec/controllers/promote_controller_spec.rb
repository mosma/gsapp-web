require 'spec_helper'

describe PromoteController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'widget'" do
    it "returns http success" do
      get 'widget'
      response.should be_success
    end
  end

  describe "GET 'takeone'" do
    it "returns http success" do
      get 'takeone'
      response.should be_success
    end
  end

  describe "GET 'business_card'" do
    it "returns http success" do
      get 'business_card'
      response.should be_success
    end
  end

  describe "GET 'tag_price'" do
    it "returns http success" do
      get 'tag_price'
      response.should be_success
    end
  end

end
