class DeletePinWorker
  include Sidekiq::Worker

  def perform(pin_id)
    if pin = Pin.where(id: pin_id).first
      pin.destroy
    end
  end
end
