module ApplicationHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def render_user_navbar
    if current_user
      render '/layouts/navbar/loggedin_nav'
    else
      render '/layouts/navbar/loggedout_nav'
    end
  end
end
