class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :authenticate_request

  def create
    user = User.create!(
      email: params[:user][:email],
      username: params[:user][:username],
      name: params[:user][:name],
      lastname: params[:user][:lastname],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
    )
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 500 }
    end
  end
end