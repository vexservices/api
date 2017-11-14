class Device < ActiveRecord::Base
  class InvalidToken < StandardError; end

  scope :ios,        -> { where(kind: '1') }
  scope :android,    -> { where(kind: '2') }
  scope :with_token, -> { where.not(push_token: nil) }

  scope :search_by_id_or_token, ->(id) { where("token = ? OR id = ?", id.to_s, id.to_i) }

  belongs_to :store
  belongs_to :user

  has_many :pins
  has_many :streets
  has_many :messages

  has_and_belongs_to_many :departments
  has_and_belongs_to_many :stores

  before_create :generate_token

  accepts_nested_attributes_for :streets

  def default_radius
    radius || 2
  end

  def token_with_mask
    "<%s %s %s %s %s %s %s %s>" % push_token.gsub(' ', '').scan(/([a-zA-Z0-9]{8})/).flatten
  end

  private

    def generate_token
      self.token = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless Device.exists?(token: random_token)
      end
    end
end
