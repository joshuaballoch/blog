RSpec::Matchers.define :allow do |user, actions, object|
  match do |ability|
    @user = user
    @actions = actions
    @object = object
    Ability.new(user).can? actions, object
  end

  def default_description
    "allow #{@user} to #{@actions} on #{@object}"
  end

  failure_message_for_should do |user|
    "expected #{user} to be able to :#{actions} on :#{object}"
  end

  failure_message_for_should_not do |user|
    "expected not to be able to :#{actions} on :#{object}"
  end
end
