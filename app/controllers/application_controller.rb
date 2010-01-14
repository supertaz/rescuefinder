class ApplicationController < ActionController::Base
  protect_from_forgery
  filter_parameter_logging :password

  helper_method :current_user
  helper_method :page_title

private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def page_title(new_title)
    render :partial => 'common/set_page_title', :locals => {:new_title => new_title}
  end

end
