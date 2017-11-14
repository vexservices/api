require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:client) { create(:client) }

  it { should belong_to :store }

  context '.authenticate' do
    it 'authenticate in app' do
      expect(described_class.authenticate(client.username, '12345678', client.store_id)).to eq client
    end

    it 'fail in attempt to login' do
      expect(described_class.authenticate(client.username, 'invalid_password', client.store_id)).to be_falsy
    end
  end

  context '.authenticate_with_token' do
    it 'authenticate with token' do
      expect(described_class.authenticate_with_token(client.token, client.store_id)).to eq client
    end

    it 'raise an error when invalid token as passed' do
      expect(described_class.authenticate_with_token('invalid_token', client.store_id)).to be_nil
    end
  end

  it '#generate_token' do
    expect{ client.generate_token! }.to change(client, :token)
  end
end
