json.pages @stores.total_pages

json.stores @stores do |store|
  json.cache! ['V1', store, current_user.try(:cache_key)] do
    json.id           store.id
    json.name         store.name
    json.formatted_name store.formatted_name
    json.short_name   store.short_name
    json.address      store.address_street
    json.city         store.address_city
    json.state        store.address_state
    json.zip          store.address_zip
    json.latitude     store.address_latitude
    json.longitude    store.address_longitude
    json.contact      store.contact
    json.phone        store.phone
    json.email        store.official_email
    json.website      store.website
    json.corporate    store.corporate
    json.favorite     store.favorite
    json.logo         store.logo.blank? ? default_image_for_logo('medium') : store.logo.url(:medium)
    json.about        simple_format(store.about)
    json.stores_count store.active_stores_count
    json.featured_product store.featured_publish.try(:product_name)
    json.favorite     store.favorite
    json.register     store.register ? store.register : false
    json.paid         store.paid
    json.price        number_to_currency(store.price)
  end
end
