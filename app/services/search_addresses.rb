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
      stores = corporate.subtree.where(search:true)
      if (corporate.app.authenticate?)
        stores = stores.select {|store|store.can_see?(user.store_ids) || store.paid}
      end
      @store_ids = stores.map(&:id)
      Rails.logger.debug "@store_ids: #{@store_ids}"
    end

end
