class Street < ActiveRecord::Base
  belongs_to :device, touch: true
end
