class Api::V1::UsersController < Api::V1::ApiController
  before_action :authorize_request, except: :create
  before_action :set_user, only: [:show, :update, :destroy]

  # GET api/v1/users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # POST api/v1/users
  def create
    @user = User.new(user_params)
    if @user.save
      json_response(@user, :created)
    else
      json_response(@user, :unprocessable_entity)
    end
  end

  # GET api/v1/users/:id
  def show
    json_response(@user)
  end

  # PUT api/v1/users/:id
  def update
    unless @user.update(user_params)
      json_response(@user, :unprocessable_entity)
    end
  end

  # DELETE api/v1/users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    # whitelist params
    params.permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
