require 'spec_helper'

describe PostsController do
  before :each do
    @admin = create :admin
  end
  context 'GET :NEW' do
    it "should work do" do
      sign_in @admin
      get :new
      response.should be_ok
    end
  end

  context 'POST :CREATE' do
    it "should work for admin" do
      sign_in @admin
      lambda do
        post_attr = FactoryGirl.attributes_for(:post)
        post :create, :post => post_attr
        response.should redirect_to assigns(:post)
        assigns(:post).user.should == @admin
      end.should change(Post,:count)
    end
    it "should not work for non-admin" do
      lambda do
        post_attr = FactoryGirl.attributes_for(:post)
        post :create, :post => post_attr
        response.should redirect_to root_path
      end.should_not change(Post,:count)
    end
    it "should not work for others" do
      lambda do
        post_attr = FactoryGirl.attributes_for(:post)
        post :create, :post => post_attr
        response.should redirect_to root_path
      end.should_not change(Post,:count)
    end
  end

  context 'GET :EDIT' do
    before do
      @post = create :post
    end
    it "should work do" do
      sign_in @admin
      get :edit, :id => @post.id
      response.should be_ok
    end
    it "should not work for others" do
      get :edit, :id => @post.id
      response.should_not be_ok
      response.should redirect_to root_path
    end
  end

  context 'POST :UPDATE' do
    before do
      @post = create :post
    end
    it "should work" do
      sign_in @admin
      post :update, :post => {:title => "A new title 123"}, :id => @post.id
      response.should redirect_to @post
      @post.reload
      @post.title.should == "A new title 123"
    end
    it "should not work for non admin" do
      post :update, :post => {:title => "A new title 123"}, :id => @post.id
      response.should redirect_to root_path
      @post.reload
      @post.title.should_not == "A new title 123"
    end
  end

  context 'GET :SHOW' do
    it "should work do" do
      sign_in @admin
      post = create :post
      get :show, :id => post.id
      response.should be_ok
    end
  end

  context 'GET :INDEX' do
    it "should work" do
      get :index
      response.should redirect_to root_path
    end
  end
end
