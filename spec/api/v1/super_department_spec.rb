require 'rails_helper'

RSpec.describe 'Api::V1::Departments' do
  let(:store)      { create(:store) }
  let(:device)     { create(:device, store: store) }
  let(:department) { create(:department, :super) }

  let(:header) { request_header(1, store.token, device.token) }

  it 'index' do
    3.times { create(:department, :super, department: department) }

    get api_super_departments_path, {}, header

    expect(response.status).to eq 200
    expect(response).to match_response_schema('super_departments')
  end
end
