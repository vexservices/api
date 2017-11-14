require 'rails_helper'

RSpec.describe 'routing to pins', type: :routing do

  it 'index' do
    expect(get: '/api/pins').to route_to(
      controller: 'api/v1/pins',
      action: 'index',
      format: 'json'
    )
  end

  it 'show' do
    expect(get: '/api/pins/2').to route_to(
      controller: 'api/v1/pins',
      action: 'show',
      id: '2',
      format: 'json'
    )
  end

  it 'create' do
    expect(post: '/api/pins').to route_to(
      controller: 'api/v1/pins',
      action: 'create',
      format: 'json'
    )
  end

  it 'edit' do
    expect(get: '/api/pins/2/edit').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/pins/2').not_to be_routable
  end

  it 'delete' do
    expect(delete: '/api/pins/2').to route_to(
      controller: 'api/v1/pins',
      action: 'destroy',
      id: '2',
      format: 'json'
    )
  end
end
