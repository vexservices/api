require 'rails_helper'

RSpec.describe 'Api::V1::Maps' do
  let(:corporate)  { create(:store) }
  let(:device)     { create(:device, store: corporate, latitude: 48.85837, longitude: 2.294422) }
  let(:department) { create(:department, store: corporate) }

  let(:header) { request_header(1, corporate.token, device.token) }

  let(:eiffel_tower) do
    create(
      :store,
      store: corporate,
      address: create(:address, :eiffel_tower ),
      department: department
    )
  end

  let(:chez_ribe) do
    create(
      :store,
      store: corporate,
      address: create(:address, :chez_ribe ),
      departments: [ department ]
    )
  end

  let(:jessica_art_gallery) do
    create(
      :store,
      :branch_store,
      address: create(:address, :jessica_art_gallery ),
      departments: [ department ]
    )
  end

  before(:each) do
    eiffel_tower
    chez_ribe
    jessica_art_gallery
  end

  it 'index' do
    get api_maps_path, {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('maps')
  end

  it 'index search by address' do
    address = eiffel_tower.address.address.gsub(', ', '%')

    get api_maps_path, { address_cont: address }, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('maps')
  end

  it 'index with radius' do
    get api_maps_path, { radius: 3 }, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('maps')
  end

  it 'index filter by super department' do
    get api_maps_path, { store_sections_id_eq: department.id }, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('maps')
  end

  context 'validate params' do
    let(:device) { create(:device, store: corporate) }

    it 'when latitude and longitude are blank' do
      get api_maps_path, { radius: 3 }, header

      expect(response.status).to eq 400
      expect(response).to match_response_schema('error')
    end
  end
end
