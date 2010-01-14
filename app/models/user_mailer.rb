class UserMailer < ActionMailer::Base
  def welcome(user)
    setup_email(user)
    @subject    += 'Welcome to DEFAULT SITE TEMPLATE -- CONFIGURE ME!!!'
    @body[:url]  = "http://www.EXAMPLE.com/"
  end

  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "accounts@EXAMPLE.com"
      @subject     = "[EXAMPLE] "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
