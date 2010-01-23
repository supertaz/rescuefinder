class User < ActiveRecord::Base
  # For authlogic:
  acts_as_authentic

  # For rails-authorization-plugin:
  acts_as_authorized_user
  acts_as_authorizable

  has_many :relatives
  has_many :addresses, :as => :addressable, :dependent => :destroy
  has_many :phone_numbers, :as => :phoneable, :dependent => :destroy

  validates_presence_of :firstname, :lastname, :email
  validates_length_of :firstname, :lastname, :in => 2..64
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_uniqueness_of :email

  def activated?
    # This is very different from the active attribute, which is a magic column for AuthLogic and allows us to disable an account
    # TODO: should use a statemachine on userstate attribute to determine the user's stage in activation and creation of records for missing persons
    true
  end
end
