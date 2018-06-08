if @store
  json.cache! ['V1', cache_key_for_message_store(@store, @device)] do
    json.store do
      json.id   @store.id
      json.name @store.name
      json.formatted_name @store.formatted_name
      json.short_name @store.short_name
      json.logo @store.logo.blank? ? default_image_for_logo('medium') : @store.logo.url(:medium)
    end
  end

  json.messages @messages do |message|
    json.cache! ['V1', message] do
      json.id         message.id
      json.message    message.message
      json.kind       message.kind
      json.read_at    message.read_at
      json.created_at message.created_at
    end
  end

else
  json.stores @stores do |store|
    json.cache! ['V1', cache_key_for_message_store(store, @device, 'message_store_summary')] do
      json.id             store.id
      json.name           store.name
      json.formatted_name store.formatted_name
      json.short_name     store.short_name
      json.logo           store.logo.blank? ? default_image_for_logo('medium') : store.logo.url(:medium)
      json.messages_count store.messages_count
    end
  end
end
