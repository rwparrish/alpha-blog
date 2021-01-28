class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # sessions enable the app to maintain a user specific state. Rails provides a session obj
      # which I can access by using the 'session' instance method for each user that accesses the app
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      # becuase 'render' does make a full http request (not redirecting) and no refresh is happening,
      # I use 'flash.now' instead of 'flash' so the message will appear as it happens
      flash.now[:alert] = "There was something wrong with your login details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end

end