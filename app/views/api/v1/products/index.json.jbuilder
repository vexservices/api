json.cache! ['V1', cache_key_for_records('publish', @publishes), @ids, current_user.try(:cache_key)], expires_in: 24.hours do
  json.products @publishes do |publish|
    json.cache! ['V1', publish], expires_in: 24.hours do

      pin = @device.pins.search(publish.id)

      json.id             publish.id
      json.product_id     publish.product_id
      json.name           publish.product_name
      json.regular_price  number_to_currency_by_store_currency publish.product_regular_price
      json.price          number_to_currency_by_store_currency publish.price
      json.description    simple_format(publish.product_description)
      json.contact_info   simple_format(publish.product_contact_info)
      json.category       publish.product_category_name
      json.payment_option publish.product_payment_option
      json.pin            pin.present?
      json.pin_id         pin.try(:id)
      json.store_id       publish.store_id
      json.store_name     publish.store_name
      json.store_logo     logo_by_store(publish.store_logo)
      json.feature_level  publish.feature_level

      if publish.product_pictures.present?
        json.images publish.product_pictures.each do |picture|
          json.thumb    picture.file.url(:thumb)
          json.medium   picture.file.url(:medium)
          json.original picture.file.url(:original)
        end
      else
        json.images [publish] do |p|
          json.thumb    default_image_for_picture('thumb')
          json.medium   default_image_for_picture('medium')
          json.original default_image_for_picture('original')
        end
      end
    end
  end
end
