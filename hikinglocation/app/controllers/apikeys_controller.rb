class ApikeysController < ApplicationController
  before_action :check_user, only: [:index, :new, :create, :destroy]
  
  def new
    @apikey = Apikey.new
  end

  def index
    @user = User.find_by(id: session[:user_id])
  end

  def create
    @apikey = Apikey.new(api_key_params)
    @apikey.tmp_user_id = session[:user_id]

    if @apikey.save
      flash[:success] = "API key was created"
      redirect_to apikeys_path
    else
      render :action => 'new'
    end
  end

  def destroy
    @apikey = Apikey.find_by(id: params[:id])
    if @apikey
      @apikey.destroy
    end
    flash[:danger] = "API key was removed"
    redirect_user
  end

  private
  def api_key_params
    params.require(:apikey).permit(:device)
  end
end