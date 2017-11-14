require 'rails_helper'

RSpec.describe 'Api::V1::Stores' do
  let(:corporate) { create(:store) }
  let(:device)    { create(:device, store: corporate) }

  let(:header) { request_header(1, corporate.token, device.token) }

  describe 'without store' do

    it 'index' do
      3.times { create(:store, :branch_store, store: corporate) }

      get api_stores_path, {}, header

      expect(response.status).to eq 200
      expect(response).to match_response_schema('stores')
    end

    it 'show' do
      get api_store_path(corporate), { }, header

      expect(response.status).to eq 200
      expect(response).to match_response_schema('store')
    end
  end

  describe 'with store' do
    let(:branch_store)  { create(:store, store: corporate) }

    it 'index' do
      3.times { create(:store, :branch_store, store: branch_store) }

      get api_store_stores_path(branch_store), {}, header

      expect(response.status).to eq 200
      expect(response).to match_response_schema('stores')
    end
  end

  it_behaves_like "validate devise token" do
    let(:valid_url)   { get api_stores_path, {}, header }
    let(:invalid_url) { get api_stores_path, {}, request_header(1, corporate.token, '-1') }
    let(:json_schema) { 'stores' }
  end

  context 'permissions' do
    let(:store)   { create(:store, store: corporate) }
    let!(:corporate_app) { create(:app, :authenticable, store: corporate) }
    let!(:client) { create(:client, store: corporate, stores: [store]) }

    let(:header) { request_header(1, corporate.token, device.token, client.token) }

    it_behaves_like "validate store permission" do
      let(:valid_url)   { get api_store_stores_path(store), nil, header }
      let(:invalid_url) { get api_store_stores_path(corporate), nil, header }
      let(:json_schema) { 'stores' }
    end
  end
end
