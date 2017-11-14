require 'rails_helper'

RSpec.describe 'Api::V1::Sessions' do
  let!(:store)     { create(:store) }
  let!(:store_app) { create(:app, store: store) }
  let!(:client)    { create(:client, store: store, username: 'username', password: '12345678') }

  context '#create' do
    it 'making request without user name' do
      post '/api/session', nil, request_header(1, store.token)
      expect(response.status).to eq 422
    end

    it 'making request without invalid credentials' do
      post '/api/session', {username: 'user', password: 'invalid'}, request_header(1, store.token)
      expect(response.status).to eq 401
    end

    it 'making a request within valid credentials' do
      post '/api/session', {username: 'username', password: '12345678'}, request_header(1, store.token)
      expect(response.status).to eq 200
    end
  end

  context '#destroy' do
    it 'logout current user' do
      delete '/api/session', {access_token: client.token}, request_header(1, store.token, nil, client.token)
      expect(response.status).to eq 200
      expect(json[:message]).to eq 'Signed out successfully'
      expect(client.reload.token).to be_nil
    end
  end
end
