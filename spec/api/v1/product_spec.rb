require 'rails_helper'

RSpec.describe 'Api::V1::Products' do
  let(:corporate) { create(:store) }
  let(:device)    { create(:device, store: corporate) }
  let!(:publish)  { create(:publish, :published, store: corporate) }

  let(:header) { request_header(1, corporate.token, device.token) }

  context 'index' do
    it 'with store' do
      get api_store_products_path(corporate), {}, header

      expect(response.status).to eq 200
      expect(response).to match_response_schema('products')
    end

    it 'without store' do
      publish

      get api_products_path(device), {}, header

      expect(response.status).to eq 200
      expect(response).to match_response_schema('products')
    end

    it 'test mode' do
      allow(corporate).to receive(:app_test_mode?) { true }

      get api_store_products_path(corporate), {}, header

      expect(response.status).to eq 200
      expect(response).to match_response_schema('products')
    end
  end

  it 'show' do
    get api_store_product_path(corporate, publish), { }, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('product')
  end

  it_behaves_like "validate devise token" do
    let(:valid_url)   { get api_store_products_path(corporate), {}, header }
    let(:invalid_url) { get api_store_products_path(corporate), {}, request_header(1, corporate.token, '-1') }
    let(:json_schema) { 'products' }
  end

  context 'permissions' do
    let(:store) { create(:store, store: corporate) }
    let!(:corporate_app) { create(:app, :authenticable, store: corporate) }
    let!(:client) { create(:client, store: corporate, stores: [store]) }

    let(:header) { request_header(1, corporate.token, device.token, client.token) }

    it_behaves_like "validate store permission" do
      let(:valid_url)   { get api_store_products_path(store), nil, header }
      let(:invalid_url) { get api_store_products_path(corporate), nil, header }
      let(:json_schema) { 'products' }
    end
  end
end
