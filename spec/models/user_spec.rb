require 'spec_helper'

describe User do
  describe 'attributes' do
    it { should respond_to :email }
    it { should respond_to :password }
    it { should respond_to :password_confirmation }
    it { should respond_to :admin }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
  end

  it 'should not allow users to be created without an Invite' do
    u = User.new(attributes_for :user)
    u.save.should_not be_true
    u.errors.to_a.first.should include("Email is not approved")
  end

  it 'admin should be default false' do
    u = create :user
    u.admin?.should be_false
  end
end
