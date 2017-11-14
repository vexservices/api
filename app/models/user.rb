class User < ActiveRecord::Base
  belongs_to :store, counter_cache: true
  has_many :devices, dependent: :delete_all
end
