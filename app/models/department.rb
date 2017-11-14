class Department < ActiveRecord::Base
  belongs_to :store
  belongs_to :department

  has_many :departments

  has_and_belongs_to_many :stores

  default_scope { order('name ASC') }

  scope :master, ->{ where(store_id: nil) }
  scope :super,  ->{ where(store_id: nil, department_id: nil) }
  scope :sub,    ->{ where(store_id: nil).where.not(department_id: nil) }
end
