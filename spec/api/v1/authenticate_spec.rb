require 'rails_helper'

RSpec.describe 'Authentication' do
  let(:store)  { create(:store) }
  let(:device) { create(:device, store: store) }

  context 'corporate authentication' do
    it 'making a request with no token' do
      get api_stores_path, nil, request_header(1)
      expect(response.status).to eq 401
    end

    it 'making a request within token' do
      get api_stores_path, nil, request_header(1, store.token, device.token)
      expect(response.status).to eq 200
    end
  end

  context 'client authentication' do
    let!(:corporate_app) { create(:app, :authenticable, store: store) }
    let(:client)         { create(:client, store: store) }

    it 'login current client with passed token' do
      get api_stores_path, nil, request_header(1, store.token, device.token, client.token)
      expect(response.status).to eq 200
    end

    it 'return error message' do
      get api_stores_path, nil, request_header(1, store.token, device.token)
      expect(response.status).to eq 401

      expect(json[:message]).to eq('Unauthorized, Invalid or expired token')
    end
  end
end
