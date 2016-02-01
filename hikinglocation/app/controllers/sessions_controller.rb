class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to apikey_path
    else
      flash.now[:danger] = 'Wrong Email/Password combo!'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:info] = 'Please come again!'
    redirect_to root_path
  end

  def create_admin
    admin = Admin.find_by(name: params[:session][:name].downcase)

    if admin && admin.authenticate(params[:session][:password])
      log_admin_in admin
      redirect_to admin_path
    else
      flash.now[:danger] = 'Wrong Name/Password combo!'
      render 'new_admin'
    end
  end

  def destroy_admin
    log_admin_out
    flash[:info] = 'Bye Admin!'
    redirect_to root_path
  end
end