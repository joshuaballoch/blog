require 'spec_helper'

describe MainController do
  context "root path" do
    it "should work" do
      visit '/'
      response.should be_success
    end
  end
end
