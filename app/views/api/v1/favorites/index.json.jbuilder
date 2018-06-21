json.cache! ['V1', cache_key_for_records('favorite', @favorites), @device.try(:id)] do
  json.favorites @favorites do |favorite|
    json.cache! ['V1', 'favorite', favorite] do
      json.id               favorite.id
      json.name             favorite.name
      json.formatted_name   favorite.formatted_name
      json.short_name       favorite.short_name
      json.address          favorite.address_street
      json.city             favorite.address_city
      json.state            favorite.address_state
      json.zip              favorite.address_zip
      json.phone            favorite.phone
      json.email            favorite.official_email
      json.website          favorite.website
      json.corporate        favorite.corporate
      json.favorite         true
      json.logo             favorite.logo.blank? ? default_image_for_logo('medium') : favorite.logo.url(:medium)
      json.about            favorite.about
      json.stores_count     favorite.stores_count
      json.featured_product favorite.featured_publish.try(:product_name)
      json.contact_button    favorite.contact_button
      json.map_button        favorite.map_button
      json.chat_button       favorite.chat_button
      json.waze_button       favorite.waze_button
      json.favorite_button   favorite.favorite_button
      json.show_address      favorite.show_address
      json.show_on_map       favorite.show_on_map
      json.map_icon          favorite.map_icon
      json.store_tab         favorite.store_tab
      json.product_tab       favorite.product_tab
      json.pdf_button_link   favorite.pdf_button_link
      json.video_button_link favorite.video_button_link
      json.banner            favorite.banner
    end
  end
end
