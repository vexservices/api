class App < ActiveRecord::Base
  belongs_to :store

  def has_google_api_key?
    google_api_key.present?
  end

  def has_apple_certificate?
    apple_certificate.present?
  end

  def authenticate?
    require_authentication?
  end
end
