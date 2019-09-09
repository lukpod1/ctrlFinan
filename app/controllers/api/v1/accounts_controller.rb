class Api::V1::AccountsController < Api::V1::ApiController
  before_action :set_account, only: [:show, :update, :destroy]

  # GET api/v1/accounts
  def index
    @accounts = @current_user.accounts.order(:name)
    render json: @accounts, status: :ok
  end

  # POST api/v1/accounts
  def create
    @account = @current_user.accounts.new(account_params)
    if @account.save
      json_response(@account, :created)
    else
      json_response(@account, :unprocessable_entity)
    end
  end

  # GET api/v1/accounts/:id
  def show
    json_response(@account)
  end

  # PUT api/v1/accounts/:id
  def update
    unless @account.update(account_params)
      json_response(@account, :unprocessable_entity)
    end
  end

  # DELETE api/v1/accounts/:id
  def destroy
    @account.destroy
    head :no_content
  end

  private

  def account_params
    # whitelist params
    params.permit(:name, :balance)
  end

  def set_account
    @account = Account.find(params[:id])
  end

end
