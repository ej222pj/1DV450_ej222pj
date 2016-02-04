module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    session[:username] = user.username
    redirect_user
  end

  def logout
    session.delete(:user_id)
    session.delete(:username)
    @user_auth = nil
  end

  def redirect_user
    if is_admin?
      redirect_to admins_path
    else
      redirect_to apikeys_path
    end
  end

  def the_current_user
    @user_auth ||= User.find_by(id: session[:user_id])
  end

  def is_admin?
    User.find_by(username: session[:username]) == User.find_by(username: "admin")
  end

  def is_user_logged_in?
    !the_current_user.nil?
  end

  def check_user
    unless is_user_logged_in?
      flash[:danger] = "Login to see your API keys!"
      redirect_to root_path
    end
  end
end
