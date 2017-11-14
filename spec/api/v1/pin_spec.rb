require 'rails_helper'

RSpec.describe 'Api::V1::Pins' do
  let(:store)   { create(:store) }
  let(:device)  { create(:device, store: store) }
  let(:pin)     { create(:pin, device: device, store: store) }
  let(:publish) { create(:publish, :published, store: store) }

  let(:header) { request_header(1, store.token, device.token) }

  it 'index' do
    pin

    get api_pins_path, {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('pins')
  end

  it 'show' do
    get api_pin_path(pin), {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('pin')
  end

  it 'create' do
    post api_pins_path, { publish_id: publish.id }, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('success_with_id')
  end

  it 'destroy' do
    delete api_pin_path(device, pin), {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('success')
  end

  it_behaves_like "validate devise token" do
    let(:valid_url)   { get api_pins_path, {}, header }
    let(:invalid_url) { get api_pins_path, {}, request_header(1, store.token, '-1') }
    let(:json_schema) { 'pins' }
  end
end
