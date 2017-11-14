class ListStores
  attr_reader :user, :corporate, :store_id, :query, :device_id, :page, :stores_ids

  def initialize(corporate, user = nil, options = {})
    @corporate = corporate
    @user      = user
    @store_id  = options.fetch(:store_id) { corporate.id }
    @query     = options.fetch(:q){ {} }
    @device_id = options.fetch(:device_id)
    @page      = options[:page]

    set_stores_ids
  end

  def fetch
    scope = Store.ransack(query).result(distinct: true)

    scope = scope.where(store_id: store_id)
                 .with_favorite(device_id)

    if stores_ids
      scope = scope.where(id: stores_ids)
    end

    scope = scope.page(page)
    scope
  end

  protected

    def set_stores_ids
      if user && !user.admin
        @stores_ids ||= user.store_ids
      end
    end
end
