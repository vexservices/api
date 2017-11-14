require 'rails_helper'

RSpec.describe 'Api::V1::Departments' do
  let(:store)  { create(:store) }
  let(:branch) { create(:store, store: store) }
  let(:device) { create(:device, store: store) }

  context 'index' do
    let!(:department) { create_list(:department, 3, store: store) }

    it 'returns all departments' do
      get api_departments_path, {}, request_header(1, store.token, device.token)

      expect(response.status).to eq 200
      expect(response).to match_response_schema('departments')
    end

    it 'returns all super departments' do
      get api_departments_path, { only_super: true }, request_header(1, store.token, device.token)

      expect(response.status).to eq 200
      expect(response).to match_response_schema('departments')
    end
  end

  context 'filter departments' do
    let!(:department) { create_list(:department, 3, store: store) }

    it 'by store' do
      create_list(:department, 3, store: branch)

      get api_departments_path, { store_id: branch.id }, request_header(1, store.token, device.token)

      expect(response.status).to eq 200
      expect(response).to match_response_schema('departments')
    end
  end
end
