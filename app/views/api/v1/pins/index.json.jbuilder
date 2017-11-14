json.cache! ['V1', cache_key_for_records('pin', @pins), @device.try(:id)] do
  json.pins @pins do |pin|
    json.cache! ['V1', pin], expires_in: 7.days do
      json.id            pin.id
      json.product_id    pin.product_id
      json.name          pin.name
      json.regular_price number_to_currency_by_store_currency pin.regular_price
      json.price         number_to_currency_by_store_currency pin.price
      json.description   simple_format(pin.description)
      json.contact_info  simple_format(pin.contact_info)
      json.category      pin.category_name
      json.year          pin.created_at.year
      json.month         pin.created_at.strftime('%m')
      json.day           pin.created_at.strftime('%d')
      json.hour          pin.created_at.strftime('%H:%M')
      json.store_name    pin.store_name
      json.store_id      pin.store_id

      if pin.pictures.present?
        json.images pin.pictures.each do |picture|
          json.thumb    picture.file.url(:thumb)
          json.medium   picture.file.url(:medium)
          json.original picture.file.url(:original)
        end
      else
        json.images [pin] do |p|
          json.thumb    default_image_for_picture('thumb')
          json.medium   default_image_for_picture('medium')
          json.original default_image_for_picture('original')
        end
      end
    end
  end
end
