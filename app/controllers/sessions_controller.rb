class SessionsController < ApplicationController

  def new
    # @session = User.new
  end

  def create
    user = User.find_by(name: session_params[:name])
    user = user.try(:authenticate, session_params[:password])
    return redirect_to("/login") unless user
    session[:user_id] = user.id
    @user = user
    redirect_to "/"
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
