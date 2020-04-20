class Api::V1::Users::SessionsController < ApplicationController
  def create
    if user == User.authenticate(user_params[:email], params[:password])
      session[:current_user] = user.id
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
