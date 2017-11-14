class Pin < ActiveRecord::Base
  include Picturable

  belongs_to :store
  belongs_to :device, touch: true
  belongs_to :publish, touch: true
  belongs_to :product

  has_many :pictures, as: :imageable, dependent: :destroy

  def self.search(publish_id)
    where(publish_id: publish_id).first
  end

  def self.copy_from_publish(publish, device)
    product = publish.product

    return false unless product.present?

    pin = create(
      publish_id: publish.id,
      store_id: publish.store_id,
      device_id: device.id,
      product_id: product.id,
      name: product.name,
      category_name: product.category_name,
      description: product.description,
      contact_info: product.contact_info,
      regular_price: product.regular_price,
      price: publish.price,
      store_name: publish.store_name
    )

    CopyImageWorker.perform_async(pin.id)

    pin

  end
end
