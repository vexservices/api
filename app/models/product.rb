class Product < ActiveRecord::Base
  include Picturable

  default_scope { order('products.name ASC') }

  scope :search_by_category, ->(ids) { where(category_id: ids) }
  scope :search_by_name, ->(term) {  where('LOWER(name) LIKE ?', "%#{ term.downcase }%") }

  belongs_to :category
  belongs_to :store
  has_many :publishes
  has_many :pictures, as: :imageable

  delegate :name, to: :category, prefix: true, allow_nil: true
end
