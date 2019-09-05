class Api::V1::AccountsController < Api::V1::ApiController
  before_action :set_account, only: [:show, :update, :destroy]
  before_action :set_user

  # GET /accounts
  def index
    @accounts = @user.accounts.order(:name)
    json_response(@accounts)
  end

  # POST /accounts
  def create
    @account = Account.create!(account_params)
    json_response(@account, :created)
  end

  # GET /accounts/:id
  def show
    json_response(@account)
  end

  # PUT /accounts/:id
  def update
    @account.update(account_params)
    head :no_content
  end

  # DELETE /accounts/:id
  def destroy
    @account.destroy
    head :no_content
  end

  private

  def account_params
    # whitelist params
    params.permit(:name, :email, :password, :password_confirmation)
  end

  def set_account
    @account = Account.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
