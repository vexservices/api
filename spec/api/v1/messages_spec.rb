require 'rails_helper'

RSpec.describe 'Api::V1::Messages' do
  let(:store)   { create(:store) }
  let(:device)  { create(:device, store: store) }
  let!(:message) { create(:message, store: store, device: device) }

  let(:header) { request_header(1, store.token, device.token) }

  context 'index' do
    it 'with store' do
      get api_store_messages_path(store), {}, header

      expect(response.status).to eq 200
      expect(response).to match_response_schema('messages_store')
    end

    it 'without store' do
      get api_messages_path, {}, header

      expect(response.status).to eq 200
      expect(response).to match_response_schema('messages')
    end
  end

  it 'create' do
    post api_store_messages_path(store), { message: { message: 'Hello world.' } }, header
    expect(response.status).to eq 200
    expect(response).to match_response_schema('message')
  end

  it 'unread' do
    get unread_api_store_messages_path(store), {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('messages_unread')
  end
end
