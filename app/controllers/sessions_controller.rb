class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.first(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: 'Logged in'
    else
      flash.now.alert = "Wrong email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out'
  end
end

