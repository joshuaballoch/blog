require 'spec_helper'

describe Post do
  describe "attributes" do
    it {should respond_to :title}
    it {should respond_to :body}
    it {should respond_to :user}
  end

  describe "mass assignment" do
    it {should allow_mass_assignment_of :title}
    it {should allow_mass_assignment_of :body}
    it {should_not allow_mass_assignment_of :user}
    it {should_not allow_mass_assignment_of :user_id}
  end

  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :body}
    it {should validate_presence_of :user}
  end

  it "should order newest posts first" do
    post1 = create :post
    post2 = create :post
    Post.all.should == [post2, post1]
  end
end
