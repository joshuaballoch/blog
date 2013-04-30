class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  #FIXME add validations

  before_validation :invited?, :on => :create

  private

  def invited?
    unless Invite.exists?(:email => email)
      errors.add :email, "is not approved for registration."
    end
  end
end
