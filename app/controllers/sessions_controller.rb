class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(user_params[:email])
    puts user.inspect
    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to :controller => "welcome", :action => 'index'
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to :controller => "welcome", :action => 'index'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
