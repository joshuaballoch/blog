require 'spec_helper'

describe "Permissions" do
  let(:guest) {User.new}
  let(:user)  { create :user }
  let(:admin) { create :admin }

  context "guest" do
    it { should allow(guest, :read, :all)}
    it { should_not allow(guest, :manage, :all)}
  end

  context "admin" do
    it { should allow(admin, :manage, :all)}
  end

  context "user" do
    it { should_not allow(user, :read, :all)}
    it { should_not allow(user, :manage, :all)}
  end
end
