class SessionsController < ApplicationController

  def new
    @session = User.new
  end

  def create
    @user = User.find_by(name: session_params[:name])
    if !@user.try(:authenticate, session_params[:password])
      redirect_to "/login"
    else
      session[:user_id] = @user.id
      redirect_to "/"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to "/login"
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end

end
