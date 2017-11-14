require 'rails_helper'

RSpec.describe 'Api::V1::Positions' do
  let(:store)  { create(:store) }
  let(:device) { create(:device, store: store) }

  let(:params) { { device: { latitude: '50.5', longitude: '100.5' } } }

  let(:header) { request_header(1, store.token, device.token) }

  it 'update' do
    put api_position_path, params, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('success')
  end

  it_behaves_like "validate devise token" do
    let(:valid_url)   { put api_position_path, params, header }
    let(:invalid_url) { put api_position_path, params, request_header(1, store.token, '-1') }
    let(:json_schema) { 'success' }
  end
end
