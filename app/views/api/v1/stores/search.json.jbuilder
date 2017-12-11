json.stores @stores do |store|
  json.cache! ['V1', store, current_user.try(:cache_key)] do
    json.id           store.id
    json.name         store.search_name
    json.display      store.short_name
  end
end
