json.categories @categories do |category|
  json.cache! ['V1', category, category.count_products, @ids, current_user.try(:cache_key)], expires_in: 24.hours do
    json.id category.id
    json.name category.name
    json.count_products category.count_products

    json.subcategories category.categories_with_count_products(@ids).each do |sub|
      json.cache! ['V1', sub, sub.count_products] do
        json.id sub.id
        json.name sub.name
        json.count_products sub.count_products
      end
    end
  end
end
