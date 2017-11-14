require 'rails_helper'

RSpec.describe 'Api::V1::Categories' do
  let(:corporate) { create(:store) }
  let(:device)    { create(:device, store: corporate) }
  let!(:category) { create(:category, store: corporate) }

  let(:header) { request_header(1, corporate.token, device.token) }

  context 'json schema' do
    let(:product)  { create(:product, store: corporate, category: category) }
    let!(:publish) { create(:publish, store: corporate, product: product) }

    it 'index' do
      get api_store_categories_path(corporate), {}, header

      expect(response.status).to eq 200
      expect(response).to match_response_schema('categories')
    end
  end

  context 'permissions' do
    let(:store)   { create(:store, store: corporate) }
    let!(:corporate_app) { create(:app, :authenticable, store: corporate) }
    let!(:client) { create(:client, store: corporate, stores: [store]) }

    let(:header) { request_header(1, corporate.token, device.token, client.token) }

    it_behaves_like "validate store permission" do
      let(:valid_url)   { get api_store_categories_path(store), nil, header }
      let(:invalid_url) { get api_store_categories_path(corporate), nil, header }
      let(:json_schema) { 'categories' }
    end
  end
end
