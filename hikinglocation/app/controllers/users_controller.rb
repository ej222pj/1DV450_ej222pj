class UsersController < ApplicationController
  before_action :check_user, only: [:delete]
  before_action :check_admin, only: [:delete_user]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      @user.api_key = ApiKey.create
      redirect_to apikey_path
    else
      render :action => "new"
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    user.destroy
    if is_admin_logged_in?
      flash[:success] = 'User and Key has been deleted.'
      redirect_to admin_path
    else
      log_out
      flash[:warning] = 'User and Key has been deleted. Register for a new key.'
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end