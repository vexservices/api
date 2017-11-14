require 'rails_helper'

RSpec.describe 'routing to devices', type: :routing do

  it 'index' do
    expect(get: '/api/devices').not_to be_routable
  end

  it 'show' do
    expect(get: '/api/device').to route_to(
      controller: 'api/v1/devices',
      action: 'show',
      format: 'json'
    )
  end

  it 'create' do
    expect(post: '/api/device/').to route_to(
      controller: 'api/v1/devices',
      action: 'create',
      format: 'json'
    )
  end

  it 'edit' do
    expect(get: '/api/device/edit').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/device').to route_to(
      controller: 'api/v1/devices',
      action: 'update',
      format: 'json'
    )
  end

  it 'delete' do
    expect(delete: '/api/device').not_to be_routable
  end
end
