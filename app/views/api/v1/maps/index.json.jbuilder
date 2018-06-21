json.stores @addresses do |address|
  json.cache! ['V1', address, address.store] do
    json.id        address.store_id
    json.name      address.store_name
    json.latitude  address.latitude
    json.longitude address.longitude
    json.phone     address.store_phone
    json.logo      address.store_logo.blank? ? default_image_for_logo('medium') : address.store_logo.url(:medium)
    json.email     address.store_official_email
    json.website   address.store_website
    json.about     simple_format(address.store_about)
    json.address   address.street
    json.city      address.city
    json.state     address.state
    json.zip       address.zip
    json.corporate address.store_corporate
    json.map_icon  address.store.map_icon
    json.show_on_map address.store.show_on_map
  end
end
