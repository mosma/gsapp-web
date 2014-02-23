require 'spec_helper'

describe MessagesController do

  describe "GET 'send'" do
    it "returns http success" do
      get 'send'
      response.should be_success
    end
  end

  describe "GET 'conversation'" do
    it "returns http success" do
      get 'conversation'
      response.should be_success
    end
  end

end
