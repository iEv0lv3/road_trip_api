class Api::V1::Users::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 201, body: UserSerializer.new(@user) }
    else
      render status: 400
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
