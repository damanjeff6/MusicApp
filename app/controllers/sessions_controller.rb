class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])

    if @user.nil?
      flash.now[:errors] = ["Invalid login information"]
      render :new
    else
      log_in_user!(@user)
      render json: => @user
    end
  end

end
