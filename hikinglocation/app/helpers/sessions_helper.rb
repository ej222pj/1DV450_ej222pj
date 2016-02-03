module SessionsHelper
  def log_in(user)
    session[:userid] = user.id
  end

  def log_out
    session.delete(:userid)
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:userid])
  end

  def is_logged_in?
    !current_user.nil?
  end

  def check_user
    unless is_logged_in?
      flash[:danger] = "You must login before you can visit this part of the application."
      redirect_to root_path
    end
  end

  def log_admin_in(admin)
    session[:adminid] = admin.id
  end

  def log_admin_out
    session.delete(:adminid)
    @current_admin = nil
  end

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:adminid])
  end

  def is_admin_logged_in?
    !current_admin.nil?
  end

  def check_admin
    unless is_admin_logged_in?
      flash[:danger] = "You must login before you can visit this part of the application."
      redirect_to root_path
    end
  end
end
