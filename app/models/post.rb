class Post < ActiveRecord::Base
  attr_accessible :title, :body

  belongs_to :user

  validates :title, :presence => true
  validates :body, :presence => true
  validates :user, :presence => true

  default_scope order('created_at DESC')

end
