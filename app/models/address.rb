class Address < ActiveRecord::Base
  belongs_to :store

  reverse_geocoded_by :latitude, :longitude

  delegate :logo, :official_email, :website, :about, :phone,
    :name, :corporate, to: :store, prefix: true
end
