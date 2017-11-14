class Api::V1::MapsController < Api::ApiController
  before_action :authenticate!, :get_device!

  def index
    options = params.permit(:radius, :latitude, :longitude)
    options[:q] = params[:q]
    options[:device_id] = @device.id

    @addresses = SearchAddresses.new(current_corporate, current_user, options).fetch

  rescue SearchAddresses::InvalidParams => e
    render json: { success: false, message: 'Latitude and Longitude needed.', status: :bad_request },
      status: :bad_request
  end
end
