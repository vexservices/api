class ListProducts
  attr_reader :user, :corporate, :store_id, :stores_ids, :query

  def initialize(corporate, user = nil, options = {})
    @corporate = corporate
    @user      = user
    @store_id  = options[:store_id]
    @query     = options.fetch(:q){ {} }

    set_stores_ids
  end

  def fetch
    scope = Publish.ransack(query).result(distinct: true)

    scope = scope.where(store_id: stores_ids)
                 .order('publishes.created_at DESC')
                 .includes(product: [ :category, :pictures ])

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
    end
end
