require 'rails_helper'

RSpec.describe 'Api::V1::Devices' do
  let(:store)  { create(:store) }
  let(:device) { create(:device, store: store) }

  let(:header) { request_header(1, store.token, device.token) }

  it 'show' do
    get api_device_path, {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('device')
  end

  it 'create' do
    post api_device_path, { device: { kind: 1, push_token: '12345678' } }, request_header(1, store.token)
    expect(response.status).to eq 200
    expect(response).to match_response_schema('device')
  end

  it 'update' do
    put api_device_path, { device: { push_token: '12345678' } }, header
    expect(response.status).to eq 200
    expect(response).to match_response_schema('device')
  end

  it 'update with streets' do
    data = { device: { push_token: '12345678', streets_attributes: [{ address: 'Street Address', latitude: 10, longitude: 10 }] }}

    put api_device_path, data, header
    expect(response.status).to eq 200
    expect(response).to match_response_schema('device')
  end
end
