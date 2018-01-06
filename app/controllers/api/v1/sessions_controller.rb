class Api::V1::SessionsController < Api::ApiController
  before_action :authenticate!, only: [:show, :update]
  before_action :ensure_params_exist, only: [:create]

  def register
    @client  = current_corporate.clients.build(client_params)

    if @client.save
      success_register(@client)
    else
      render json: { success: false, errors: @client.errors, full_message: @client.errors.full_messages, status: :unprocessable_entity }
    end
  end
  def create
    if client = Client.authenticate(params[:username], params[:password], current_corporate.id)
      success_login(client)
    else
      invalid_login_attempt
    end
  end
  def show
    @client = current_user
  end
  def update

    @client = current_user
    store_ids = client_params.delete(:store_ids)
    if @client.update_attributes(client_params)
      if store_ids
        @client.store_ids = store_ids.split(',')
      end
      render :show, id: @client.id
    else
      render json: {errors: @client.errors, status: :unprocessable_entity}
    end
  end
  def destroy
    if current_user
      current_user.token = nil
      current_user.save
    end

    success_logout
  end

  protected
    def ensure_params_exist
      return unless params[:username].blank? || params[:password].blank?
      render json: { success: false, message: "missing user_login and/or password parameter" }, status: 422
    end

    def invalid_login_attempt
      render json: { success: false, message: "Error with your login or password" }, status: 401
    end

    def success_login(client)
      render json: { success: true, token: client.token, message: "Signed in successfully", name: client.name, username: client.username, email: client.email, store_ids: client.store_ids }, status: 200
    end

    def success_register(client)
      render json: { success: true, token: client.token, message: "Registration successful", name: client.name, username: client.username, email: client.email, store_ids: client.store_ids }, statue: 200
    end
    def success_logout
      render json: { success: true, message: "Signed out successfully" }, status: 200
    end

    def client_params
      params.require(:client).permit(:username, :password, :name, :email, :blocked, :store_ids)
    end
end
