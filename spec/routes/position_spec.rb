require 'rails_helper'

RSpec.describe 'routing to position', type: :routing do

  it 'show' do
    expect(get: '/api/position').not_to be_routable
  end

  it 'edit' do
    expect(get: '/api/position/edit').not_to be_routable
  end

  it 'create' do
    expect(post: '/api/position').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/position').to route_to(
      controller: 'api/v1/positions',
      action: 'update',
      format: 'json'
    )
  end

  it 'delete' do
    expect(delete: '/api/position').not_to be_routable
  end
end
