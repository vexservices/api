class CopyImageWorker
  include Sidekiq::Worker

  def perform(pin_id)
    pin = Pin.find(pin_id)

    if product = pin.product
      product.pictures.each do |picture|
        new_picture = pin.pictures.build

        if Rails.env.production? || Rails.env.staging?
          new_picture.remote_file_url = picture.file.url
        else
          file = File.open(picture.file.path)
          new_picture.file = file
          file.close
        end

        new_picture.save!
      end
    end
  end
end
