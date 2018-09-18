class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]

  def login
    @user = User.find_by(username: user_login_params[:username])
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user.for_login, jwt: token}, status: :created
    else
      render json: { message: 'Invalid username or password'}, status: 401
    end
  end

  def reauth
    render json: @user.for_login, status: :accepted
  end
  #
  # def create
  #   @user = User.new(username: user_login_params[:username], password: user_login_params[:password])
  #   if @user.save
  #     token = encode_token({user_id: @user.id})
  #     user_hash = JSON.parse(@user.to_json)
  #     user_hash["jwt"] = token
  #     render json: user_hash, status: 202
  #   else
  #     render json: { message: 'Username already exists'}, status: 401
  #   end
  # end

  private

  def user_login_params
    params.require(:user).permit(:username,:password)
  end

end
