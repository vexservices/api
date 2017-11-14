require 'rails_helper'

RSpec.describe 'routing to maps', type: :routing do

  it 'index' do
    expect(get: '/api/maps').to route_to(
      controller: 'api/v1/maps',
      action: 'index',
      format: 'json'
    )
  end

  it 'show' do
    expect(get: '/api/maps/1').not_to be_routable
  end

  it 'create' do
    expect(post: '/api/maps').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/maps').not_to be_routable
  end

  it 'delete' do
    expect(delete: '/api/maps').not_to be_routable
  end
end
