class Api::V1::MapsController < Api::ApiController
  before_action :authenticate!, :get_device!, :set_store

  def index
    options = params.permit(:radius, :latitude, :longitude)
    options[:q] = params[:q]
    options[:device_id] = @device.id

    if (@store)
      store = @store
    else
      store = current_corporate
    end
    @addresses = SearchAddresses.new(store, current_user, options).fetch

  rescue SearchAddresses::InvalidParams => e
    render json: { success: false, message: 'Latitude and Longitude needed.', status: :bad_request },
      status: :bad_request
  end

    def set_store
      @store = Store.find(params[:store_id]) if params[:store_id]
    end

end
