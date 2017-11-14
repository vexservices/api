class Client < ActiveRecord::Base
  class InvalidLogin < StandardError; end
  class AuthorizationError < StandardError; end

  include EncryptPassword

  belongs_to :store
  has_and_belongs_to_many :stores

  def self.authenticate(username, password, store_id)
    if client = where(username: username, store_id: store_id, blocked: false).first
      if client.password == password
        client.generate_token!

        return client
      end
    end

    false
  end

  def self.authenticate_with_token(token, store_id)
    if token
      where(token: token, store_id: store_id).first
    end
  end

  def can_see_store?(store_id)
    if admin?
      true
    else
      store_ids.include?(store_id.to_i)
    end
  end

  def generate_token!
    self.token = SecureRandom.hex
    self.save!
  end
end
