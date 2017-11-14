class Api::V1::FavoritesController < Api::ApiController
  before_action :get_device!
  before_action :set_favorite, only: [:create, :destroy]

  def index
    @favorites = @device.stores
  end

  def create
    if @device.store_ids = @device.store_ids.push(@favorite.id)
      @favorite.try(:touch)

      render json: { success: true, status: :ok }
    else
      render json: { success: false, status: :unprocessable_entity }
    end
  end

  def destroy
    if @device.store_ids = @device.store_ids.reject! { |i| i == @favorite.id }
      @favorite.try(:touch)

      render json: { success: true, status: :ok }
    else
      render json: { success: false, status: :unprocessable_entity }
    end
  end

  private
    def set_favorite
      @favorite = Store.find(params[:id])
    end
end
