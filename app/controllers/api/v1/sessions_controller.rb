class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    user && user.authenticate(params[:password])
    session[:user_id] = user.id
    response = {"api_key" => "#{user.api_key}"}
    render json: response
  end

  # private
  #
  # def session_params
  #   params.permit(:email, :password, :password_confirmation)
  # end

end
