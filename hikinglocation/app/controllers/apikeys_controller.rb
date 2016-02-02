class ApikeysController < ApplicationController
  before_action :check_user

  def show
    @key = @current_user.api_key
  end
end
