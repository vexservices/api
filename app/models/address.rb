class Address < ActiveRecord::Base
  belongs_to :store

  reverse_geocoded_by :latitude, :longitude

  enum map_icon: [:marker, :fuel, :food, :exit, :hotel, :hospital]

  delegate :logo, :official_email, :website, :about, :phone,
    :name, :short_name, :formatted_name, :search_name, :corporate, 
    :show_on_map, :map_icon, :display_name,
    to: :store, prefix: true
end
