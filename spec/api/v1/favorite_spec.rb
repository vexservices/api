require 'rails_helper'

RSpec.describe 'Api::V1::Favorites' do
  let(:store)  { create(:store) }
  let(:device) { create(:device, store: store, stores: [ store ]) }
  let(:branch_store) { create(:store, :branch_store) }

  let(:header) { request_header(1, store.token, device.token) }

  it 'index' do
    get api_favorites_path, {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('favorites')
  end

  it 'create' do
    post api_favorites_path, { id: branch_store.id }, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('success')
  end

  it 'destroy' do
    delete api_favorite_path(store), {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('success')
  end

  it_behaves_like "validate devise token" do
    let(:valid_url)   { get api_favorites_path, {}, header }
    let(:invalid_url) { get api_favorites_path, {}, request_header(1, store.token, '-1') }
    let(:json_schema) { 'favorites' }
  end
end
