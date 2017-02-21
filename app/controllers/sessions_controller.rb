class SessionsController < ApplicationController
  skip_before_action :require_user

  def new
    render layout: false
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end
end
