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
  end

  def fetch
    scope = Address.ransack(query).result(distinct: true)

    if user && !user.admin
      stores_ids = user.store_ids
    else
      stores_ids = corporate.subtree_ids
    end

    scope = scope.joins(:store).where(store_id: stores_ids )

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
end
