class AdminsController < ApplicationController
  before_action :check_admin

  def show
    @users = User.all
  end
end
