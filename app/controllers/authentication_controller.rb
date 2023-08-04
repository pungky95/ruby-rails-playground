class AuthenticationController < ApplicationController
  before_action :authorize_request, except: [:login, :register]

  def login
    @user = User.find_by_email(params[:email])
    if @user.check_password(params[:password])
      payload = { user_id: @user.id }
      exp = 24.hours.from_now
      token = JsonWebToken.encode(payload, exp)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     user: @user }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def register
    @user = User.create!(register_params)
    render json: @user, status: :created
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def register_params
    params.permit(:first_name, :last_name, :email, :password)
  end
end
