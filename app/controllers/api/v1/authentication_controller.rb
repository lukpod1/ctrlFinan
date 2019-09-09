class Api::V1::AuthenticationController < Api::V1::ApiController
  skip_before_action :authorize_request

  # POST /auth/login
  def login
    # Find user on database by email
    @user = User.find_by_email(params[:email])
    # Verify if user exists and if the password matched with user
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
