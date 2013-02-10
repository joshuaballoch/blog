require 'spec_helper'

describe Post do
  describe "attributes" do
    it {should respond_to :title}
    it {should respond_to :body}
  end

  describe "mass assignment" do
    it {should allow_mass_assignment_of :title}
    it {should allow_mass_assignment_of :body}
  end

  describe "validations" do
    it {should validate_presence_of :title}
    it {should validate_presence_of :body}
  end
end
