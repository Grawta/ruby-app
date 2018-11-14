class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to user, alert:"User logged in"
    else
      redirect_to login_url, alert:"Invalid User or Password"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert:"Successfully destroy"
  end
end
