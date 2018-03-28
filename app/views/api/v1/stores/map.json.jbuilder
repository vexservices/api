json.stores @stores do |store|
  json.cache! ['V1', store, current_user.try(:cache_key)] do
    json.id           store.id
    json.name         store.short_name
    json.about        store.about
    json.latitude     store.address.latitude
    json.longitude    store.address.longitude
  end
end

