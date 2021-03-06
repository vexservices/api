json.stores @addresses do |store|
  json.id           store.store_id
  json.name         store.store_search_name
  json.display      store.store_display_name
end
json.cache! ['V1', cache_key_for_records('publish', @publishes), @ids, current_user.try(:cache_key)], expires_in: 24.hours do
  json.products @publishes do |publish|
    json.cache! ['V1', publish], expires_in: 24.hours do
      json.id             publish.id
      json.product_id     publish.product_id
      json.store_id       publish.store_id
      json.name           publish.product_name
      json.display        publish.product_name
    end
  end
end



