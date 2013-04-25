require 'spec_helper'

describe PostsController do
  context 'POST :CREATE' do
    it "should work" do
      lambda do
        post_attr = FactoryGirl.attributes_for(:post)
        post :create, :post => post_attr
        response.should redirect_to assigns(Post.last)
      end.should change(Post,:count)
    end
  end

  context 'GET :UPDATE' do
    let {:post}
    it "should work"
  end

  context 'POST :UPDATE' do
    it "should work"
  end

  context 'GET :SHOW' do
    it "should work"
  end

  context 'GET :INDEX' do
    it "should work"
  end
end
