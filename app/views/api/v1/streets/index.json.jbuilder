json.cache! [cache_key_for_records('street', @streets), @device.try(:id)] do
  json.streets @streets do |street|
    json.cache! ['V1', street] do
      json.id        street.id
      json.address   street.address
      json.latitude  street.latitude
      json.longitude street.longitude
    end
  end
end
