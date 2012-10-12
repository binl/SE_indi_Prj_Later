require 'spec_helper'

describe AdminsController do

  describe "GET 'management'" do
    it "returns http success" do
      get 'management'
      response.should be_success
    end
  end

end
