class SessionsController < ApplicationController::Base
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    cookies[:user_id]
    flash[:success] = "Hello, #{user.name}!"
    redirect_to root_url 
  end
  
  def destroy
    cookies.delete(:user_id)
    flash[:success] = "See ya!"
    redirect_to root_url
  end

  def failure
    reder text: "You've tried to authenticate via #{params[:strategy]}, but the following error occurred: #{params[:message]}, please try again."
  end
end
