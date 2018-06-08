class SearchAddresses
  class InvalidParams < StandardError; end

  attr_reader :corporate, :user, :query, :radius, :longitude, :latitude, :device_id

  def initialize(corporate, user = nil, options = {})
    @corporate = corporate
    @user = user

    @query     = options.fetch(:q) { {} }
    @radius    = options[:radius]
    @latitude  = options[:latitude]
    @longitude = options[:longitude]
    @device_id = options[:device_id]

    set_store_ids
  end

  def fetch
    scope = Address.ransack(query).result(distinct: true)

    scope = scope.joins(:store).where(store_id: @store_ids )

    device = Device.search_by_id_or_token(device_id).first

    if !radius.present?
      radius = device.radius
    end

    if radius.present?

      device = Device.search_by_id_or_token(device_id).first

      @latitude  ||= device.latitude
      @longitude ||= device.longitude
      if latitude.present? && longitude.present?
        scope = scope.near([latitude, longitude], radius, units: :km)
      else
        raise InvalidParams
      end
    end

    scope
  end

  protected

    def set_store_ids
      corporate_ids = corporate.subtree_ids
      user_ids = user.store_ids
      stores = Store.where(paid:true)
      paid_ids = stores.map(&:id)

      @store_ids = corporate_ids & (user_ids | paid_ids)

    end

end
