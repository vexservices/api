class Api::V1::CategoriesController < Api::ApiController
  #before_action :authenticate!, :verify_user_permissions!

  def index
    list_categories = ListCategories.new(
      current_corporate,
      current_user,
      store_id: params[:store_id]
    )

    @categories = list_categories.fetch
    @ids = list_categories.stores_ids
  end
end
