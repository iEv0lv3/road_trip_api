class ApplicationController < ActionController::API
  private

  def current_user
    @current_user ||= session[:current_user] && User.find_by(id: session[:current_user])
  end
end
