class UserObserver < ActiveRecord::Observer
  def after_create(user)
    UserMailer.deliver_welcome(user)
  end
end
