require 'rails_helper'

RSpec.describe 'Api::V1::Streets' do
  let(:store)  { create(:store) }
  let(:device) { create(:device, store: store) }
  let(:street) { create(:street, device: device) }

  let(:header) { request_header(1, store.token, device.token) }

  it 'index' do
    street

    get api_streets_path, {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('streets')
  end

  it 'create' do
    params = { street: { address: 'Address', latitude: '100', longitude: '50' } }

    post api_streets_path, params, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('success_with_id')
  end

  it 'destroy' do
    delete api_street_path(street), {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('success')
  end

  it_behaves_like "validate devise token" do
    let(:valid_url)   { get api_streets_path, {}, header }
    let(:invalid_url) { get api_streets_path, {}, request_header(1, store.token, '-1') }
    let(:json_schema) { 'streets' }
  end
end
