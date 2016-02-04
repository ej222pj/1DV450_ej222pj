class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user
    else
      flash.now[:danger] = 'Invalid Email or Password!'
      render 'new'
    end
  end

  def destroy
    logout

    flash[:success] = "You have logged out!"
    redirect_to root_path
  end
end