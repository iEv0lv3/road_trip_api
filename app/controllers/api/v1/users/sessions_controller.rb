class Api::V1::Users::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])
                .try(:authenticate, params[:user][:password])

    if @user
      session[:current_user] = @user.id
      render json: { status: 201, body: UserSerializer.new(@user) }
    else
      render status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
