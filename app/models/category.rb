class Category < ActiveRecord::Base
  scope :master, -> { where(category_id: nil) }
  scope :search_by_id, ->(id) { where('category_id = :id OR id = :id', id: id ) }

  belongs_to :store
  has_many :products
  has_many :categories

  def self.publishes_count(id)
    %Q{
      ( SELECT COUNT(p.id) FROM publishes p
        INNER JOIN products pr ON pr.id = p.product_id
        INNER JOIN categories c ON c.id = pr.category_id AND (c.id = categories.id OR c.category_id = categories.id)
        WHERE p.store_id in (#{ id })
        AND p.published_until >= '#{DateTime.now.strftime('%Y-%m-%d %H:%M:%S')}'
      ) AS count_products
    }
  end

  def self.with_count_products(ids)
    master.select('categories.id, categories.name, categories.updated_at')
          .select(publishes_count(ids))
  end

  def categories_with_count_products(ids)
    categories.select('categories.id, categories.name, categories.updated_at')
              .select(Category.publishes_count(ids))
  end
end
