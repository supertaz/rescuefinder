class UserSession < Authlogic::Session::Base
  consecutive_failed_logins_limit 4
  failed_login_ban_for(4.hours)

end
