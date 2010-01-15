class User < ActiveRecord::Base
  # For authlogic:
  acts_as_authentic

  # For rails-authorization-plugin:
  acts_as_authorized_user
  acts_as_authorizable

  has_many :relatives

  has_many :addresses

  validates_presence_of :firstname, :lastname, :email
  validates_length_of :firstname, :lastname, :in => 2..64
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email
end
