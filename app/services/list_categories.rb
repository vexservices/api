class ListCategories
  attr_reader :user, :corporate, :store_id, :stores_ids

  def initialize(corporate, user = nil, options = {})
    @corporate = corporate
    @user = user
    @store_id = options[:store_id]

    set_stores_ids
  end

  def fetch
    scope = Category.where(store_id: corporate.subtree_ids)
    scope = scope.with_count_products(stores_ids)
    scope
  end

  protected

    def set_stores_ids
      @stores_ids = [store_id] if store_id

      if user && !user.admin
        @stores_ids ||= user.store_ids
      else
        @stores_ids ||= corporate.subtree_ids
      end

      @stores_ids = @stores_ids.join(', ')
    end
end
