FactoryGirl.define do
  factory :user, :class => User do
    email { Randgen.word+"@email.com" }
    password              { "password" }
    password_confirmation { "password" }
    before(:create) { |user| Invite.create(:email => user.email) }
  end
  factory :admin, :class => User do
    email { Randgen.word+"@email.com" }
    password              { "password" }
    password_confirmation { "password" }
    admin true
    before(:create) { |user| Invite.create(:email => user.email) }
  end
end
