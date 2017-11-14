class Api::V1::DevicesController < Api::ApiController
  before_action :get_device!, only: [:show, :update]

  def show
  end

  def create
    @device = current_corporate.devices.build(device_params)

    if @device.save
      render :show, id: @device.id
    else
      render json: { errors: @device.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @device.update_attributes(device_params)
      render :show, id: @device.token
    else
      render json: { errors: @device.errors, status: :unprocessable_entity }
    end
  end

  private

    def device_params
      params.require(:device).permit(
        :push_token, :kind, :latitude, :longitude, :radius, :locale,
        :name, :email, :phone, department_ids: [],
        streets_attributes: [:id, :address, :latitude, :longitude, :_destroy]
      )
    end
end
