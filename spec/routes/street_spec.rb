require 'rails_helper'

RSpec.describe 'routing to streets', type: :routing do

  it 'index' do
    expect(get: '/api/streets').to route_to(
      controller: 'api/v1/streets',
      action: 'index',
      format: 'json'
    )
  end

  it 'show' do
    expect(get: '/api/streets/2').not_to be_routable
  end

  it 'create' do
    expect(post: '/api/streets').to route_to(
      controller: 'api/v1/streets',
      action: 'create',
      format: 'json'
    )
  end

  it 'edit' do
    expect(get: '/api/streets/2/edit').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/streets/2').to route_to(
      controller: 'api/v1/streets',
      action: 'update',
      id: '2',
      format: 'json'
    )
  end

  it 'delete' do
    expect(delete: '/api/streets/2').to route_to(
      controller: 'api/v1/streets',
      action: 'destroy',
      id: '2',
      format: 'json'
    )
  end
end
