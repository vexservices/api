json.client do
  json.id           @client.id
  json.name         @client.name
  json.username     @client.username
  json.token        @client.token
  json.admin        @client.admin
  json.blocked      @client.blocked
  json.store_ids    @client.store_ids
  json.stores @client.stores do |store|
    json.id    store.id
    json.name  store.name
  end
end
