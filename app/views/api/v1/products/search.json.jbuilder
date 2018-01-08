json.cache! ['V1', cache_key_for_records('publish', @publishes), @ids, current_user.try(:cache_key)], expires_in: 24.hours do
  json.products @publishes do |publish|
    json.cache! ['V1', publish], expires_in: 24.hours do

      pin = @device.pins.search(publish.id)

      json.id             publish.id
      json.product_id     publish.product_id
      json.name           publish.product_name
      json.display        publish.product_name
    end
  end
end
