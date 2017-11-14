json.cache! ['v1', @device] do
  json.id         @device.id
  json.token      @device.token
  json.push_token @device.push_token
  json.kind       @device.kind
  json.latitude   @device.latitude
  json.longitude  @device.longitude
  json.radius     @device.radius
  json.name       @device.name
  json.email      @device.email
  json.phone      @device.phone

  json.departments @device.departments do |department|
    json.cache! ['v1', department] do
      json.id   department.id
      json.name department.name
    end
  end

  json.streets @device.streets do |street|
    json.cache! ['v1', street] do
      json.id        street.id
      json.address   street.address
      json.latitude  street.latitude
      json.longitude street.longitude
    end
  end
end
