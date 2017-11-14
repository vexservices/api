require 'rails_helper'

RSpec.describe 'routing to stores', type: :routing do

  it 'index' do
    expect(get: '/api/stores').to route_to(
      controller: 'api/v1/stores',
      action: 'index',
      format: 'json'
    )
  end

  it 'show' do
    expect(get: '/api/stores/2').to route_to(
      controller: 'api/v1/stores',
      action: 'show',
      id: '2',
      format: 'json'
    )
  end

  it 'create' do
    expect(post: '/api/stores').not_to be_routable
  end

  it 'edit' do
    expect(get: '/api/stores/2/edit').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/stores/2').not_to be_routable
  end

  it 'delete' do
    expect(delete: '/api/stores/2').not_to be_routable
  end
end
