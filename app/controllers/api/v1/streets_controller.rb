class Api::V1::StreetsController < Api::ApiController
  before_action :get_device!
  before_action :set_street, only: [:update, :destroy]

  def index
    @streets = @device.streets
  end

  def create
    @street = @device.streets.create(params_street)

    if @street.save
      render json: { success: true, status: :ok, id: @street.id }
    else
      render json: { success: false, status: :unprocessable_entity }
    end
  end

  def update
    if @street.update_attributes(params_street)
      render json: { success: true, status: :ok, id: @street.id }
    else
      render json: { success: false, status: :unprocessable_entity }
    end
  end

  def destroy
    if @street.destroy
      render json: { success: true, status: :ok }
    else
      render json: { success: false, status: :unprocessable_entity }
    end
  end

  private

    def set_street
      @street = @device.streets.find(params[:id])
    end

    def params_street
      params.require(:street).permit(:address, :latitude, :longitude)
    end
end
