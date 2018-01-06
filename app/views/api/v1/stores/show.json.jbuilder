json.cache! ['V1', @store] do
  json.id           @store.id
  json.name         @store.name
  json.address      @store.address_street
  json.city         @store.address_city
  json.state        @store.address_state
  json.zip          @store.address_zip
  json.phone        @store.phone
  json.email        @store.official_email
  json.website      @store.website
  json.corporate    @store.corporate
  json.logo         @store.logo.blank? ? default_image_for_logo('medium') : @store.logo.url(:medium)
  json.about        simple_format(@store.about)
  json.stores_count @store.stores_count
  json.featured_product @store.featured_publish.try(:product_name)
  json.favorite         @store.favorite
  json.register         @store.register? ? @store.register : false
  json.paid             @store.paid
  json.price            number_to_currency(@store.price)
end
