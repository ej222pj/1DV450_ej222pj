class AdminsController < ApplicationController
  before_action :check_user, only: [:show, :destroy]

  def show
    @user = User.all
  end

  def destroy
    @destroyUser = User.find_by(id: params[:id])

    if @destroyUser
      @destroyUser.destroy
      flash[:success] = "Removed User!"
    else
      flash[:danger] = "User does not exit!"
    end

    redirect_to admins_path
  end
end