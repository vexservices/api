class Store < ActiveRecord::Base
  has_ancestry cache_depth: true

  default_scope do
    where('stores.active = :status AND stores.blocked <> :status', status: true)
    .order('stores.name ASC')
  end

  belongs_to :store
  belongs_to :department
  belongs_to :sub_department, class_name: 'Department'

  has_one :address
  has_one :app

  has_many :devices
  has_many :stores
  has_many :categories
  has_many :publishes
  has_many :sections, class_name: 'Department'
  has_many :messages

  has_and_belongs_to_many :departments

  delegate :state, :city, :street, :zip, :country, :latitude, :longitude,
    to: :address, prefix: true, allow_nil: true

  delegate :test_mode?, to: :app, prefix: true, allow_nil: true

  mount_uploader :logo, LogoUploader

  def self.with_messages(device)
    joins(:messages)
      .select('stores.id, stores.name, stores.logo, stores.updated_at')
      .select('SUM(CASE WHEN messages.read_at IS NULL AND messages.kind = 2 THEN 1 ELSE 0 END) as messages_count')
      .group('stores.id, stores.name, stores.logo')
      .merge(Message.of_device(device.id))
  end

  def money_currency
    @money_currency ||= Money::Currency.new(self.currency)
  end

  def money_delimiter
    money_currency.delimiter
  end

  def money_unit
    money_currency.symbol
  end

  def money_separator
    money_currency.separator
  end

  def self.with_favorite(device_id)
    sql = "select count(1) from devices_stores where store_id = stores.id AND device_id = #{ device_id }"

    select('stores.*')
      .select("CASE WHEN (#{ sql }) > 0 THEN TRUE ELSE FALSE END AS favorite")
      .reorder("CASE WHEN (#{ sql }) > 0 THEN TRUE ELSE FALSE END DESC, stores.name ASC")
  end

  def logo_or_default(size = :thumb)
    logo.blank? ? "#{ self.class.name.downcase }/#{ size.to_s }.png" : logo.url(size)
  end

  def featured_publish
    @featured ||= publishes.featured.first || publishes.first
  end
end
