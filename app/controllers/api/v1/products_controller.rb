class Api::V1::ProductsController < Api::ApiController
  before_action :authenticate!, :verify_user_permissions!, :get_device!

  def index
    options = params.permit(:store_id)
    options[:q] = params[:q]

    list_products = ListProducts.new(current_corporate, current_user, options)

    @publishes = list_products.fetch
    @ids = list_products.stores_ids
  end

  def show
    @publish = Publish.find(params[:id])
    @pin = @device.pins.search(@publish.id)
  end

  private

    def set_device
      @device = Device.search_by_id_or_token(params[:device_id]).first
    end
end
