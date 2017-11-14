class Api::V1::PositionsController < Api::ApiController
  before_action :get_device!

  def update
    if @device.update_attributes(device_params)
      render json: { success: true, status: :ok }
    else
      render json: { errors: @device.errors, status: :unprocessable_entity }
    end
  end

  private
    def device_params
      params.require(:device).permit(:latitude, :longitude)
    end
end
