class Api::ApiController < ApplicationController
  protect_from_forgery with: :null_session

  respond_to :json
  before_action :restrict_access

  def current_corporate
    @corporate
  end
  helper_method :current_corporate

  def current_app
    @current_app ||= current_corporate.app
  end
  helper_method :current_app

  def current_user
    @current_user ||= Client.authenticate_with_token(access_token, current_corporate.id)
  end
  helper_method :current_user

  rescue_from Client::InvalidLogin do |exception|
    render json: { message: 'Unauthorized, Invalid or expired token' }, status: 401
  end

  rescue_from Client::AuthorizationError do |exception|
    render json: { message: 'Not allowed to perform this action' }, status: 401
  end

  rescue_from Device::InvalidToken do |exception|
    render json: { message: 'Invalid device token' }, status: 404
  end

  private

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        @corporate = Store.where(token: token).first
        @corporate.present?
      end
    end

    def access_token
      request.headers['X-Access-Token']
    end

    def device_token
      request.headers['X-Device-Token']
    end

    def authenticate!
      if authenticate?
        raise Client::InvalidLogin unless current_user
      end
    end

    def authenticate?
      current_app && current_app.authenticate?
    end

    def get_device!
      unless @device = Device.search_by_id_or_token(device_token).first
        raise Device::InvalidToken
      end
    end

    def verify_user_permissions!
      if authenticate? && params[:store_id] && !current_user.can_see_store?(params[:store_id])
        raise Client::AuthorizationError
      end
    end
end
