class Api::V1::PinsController < Api::ApiController
  before_action :get_device!
  before_action :set_publish, only: [:create]

  def index
    @pins = @device.pins.includes(:pictures)
  end

  def show
    @pin = @device.pins.find(params[:id])
  end

  def create
    @pin = Pin.copy_from_publish(@publish, @device)

    if @pin.present?
      render json: { success: true, status: :ok, id: @pin.id }
    else
      render json: { success: false, status: :unprocessable_entity }
    end
  end

  def destroy
    DeletePinWorker.perform_async(params[:id])

    render json: { success: true, status: :ok }
  end

  private

    def set_publish
      @publish = Publish.find(params[:publish_id])
    end
end
