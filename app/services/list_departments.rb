class ListDepartments
  attr_reader :user, :corporate, :only_super, :store

  def initialize(corporate, user = nil, options = {})
    @corporate = corporate
    @user = user
    @only_super = options[:only_super]
    @store = corporate.ancestors.find_by(id: options[:store_id])
  end

  def fetch
    if only_super
      scope = Department.super
    else
      scope = corporate.sections
                       .joins(:stores)
                       .distinct
    end

    if user && !user.admin?
      scope = scope.joins(:stores).where(stores: { id: user.store_ids })
    end

    if store
      scope = scope.joins(:stores).where(stores: {id: store.subtree_ids})
    end

    scope = scope.order('name ASC')
    scope.distinct
  end
end
