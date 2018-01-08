class Api::V1::StoresController < Api::ApiController
  before_action :authenticate!, :verify_user_permissions!, :get_device!

  def index
    options = params.permit(:store_id, :page)
    options[:q] = params[:q]
    options[:device_id] = @device.id
    @stores = ListStores.new(current_corporate, current_user, options).fetch
    @stores = @stores.with_favorite(@device.id)
  end

  def show
    @store = Store.with_favorite(@device.id).find(params[:id])
  end
  def search

    options = params.permit(:store_id)
    options[:q] = params[:q]

    list_products = ListProducts.new(current_corporate, current_user, options)

    @publishes = list_products.fetch
    @ids = list_products.stores_ids

    @stores = current_corporate.subtree.where(search: true)
  end
  def pay
    @stores = current_corporate.subtree.where(paid: true)
  end
end
