class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.new_record?
      guest(user)
    elsif user.admin?
      admin(user)
    end
  end

  def admin(user)
    can :manage, :all
  end

  def guest(user)
    can :read, :all
  end
end
