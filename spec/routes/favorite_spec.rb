require 'rails_helper'

RSpec.describe 'routing to favorites', type: :routing do

  it 'index' do
    expect(get: '/api/favorites').to route_to(
      controller: 'api/v1/favorites',
      action: 'index',
      format: 'json'
    )
  end

  it 'show' do
    expect(get: '/api/favorites/2').not_to be_routable
  end

  it 'create' do
    expect(post: '/api/favorites').to route_to(
      controller: 'api/v1/favorites',
      action: 'create',
      format: 'json'
    )
  end

  it 'edit' do
    expect(get: '/api/favorites/2/edit').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/favorites/2').not_to be_routable
  end

  it 'delete' do
    expect(delete: '/api/favorites/2').to route_to(
      controller: 'api/v1/favorites',
      action: 'destroy',
      id: '2',
      format: 'json'
    )
  end
end
