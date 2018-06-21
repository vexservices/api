class Publish < ActiveRecord::Base
  default_scope do
    where(removed_at: nil)
    .where('published_until >= ?', DateTime.now)
    .order(feature_level: :desc, created_at: :desc)
  end

  scope :without_store, -> { where(store_id: nil) }
  scope :featured,      -> { where('publishes.feature_level > 0') }

  belongs_to :product
  belongs_to :store

  delegate :name, :regular_price, :description, :category_name, :image,
    :contact_info, :pictures, :payment_option, :banner,
    to: :product, prefix: true, allow_nil: true

  delegate :name, :logo, to: :store, prefix: true, allow_nil: true

  def self.search_by_name(term)
    joins(:product)
    .where('LOWER(products.name) LIKE ?', "%#{ term.downcase }%")
  end

  def self.search_by_category(ids)
    joins(:product)
    .where('products.category_id in (?)', ids)
  end
end
