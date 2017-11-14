class Api::V1::SessionsController < Api::ApiController
  before_action :ensure_params_exist, only: [:create]

  def create
    if client = Client.authenticate(params[:username], params[:password], current_corporate.id)
      success_login(client.token)
    else
      invalid_login_attempt
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

    def success_login(token)
      render json: { success: true, token: token, message: "Signed in successfully" }, status: 200
    end

    def success_logout
      render json: { success: true, message: "Signed out successfully" }, status: 200
    end
end
