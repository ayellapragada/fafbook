class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password]) ||  User.find_by(session_token: params[:user][:token])

    if @user
      login!(@user)
      render "api/users/login", user: @user
    else
      render json: ["Invalid email/password combination"], status: 401
    end
  end

  def show
    @user = current_user
    render "api/users/login", user: @user
  end

  def destroy
    @user = current_user
    if @user
      logout!
      render json: ["Logged Out!"]
    else
      render json: ["No one is logged in"], status: 404
    end
  end
end
