require 'rails_helper'

RSpec.describe 'routing to categories', type: :routing do

  it 'index' do
    expect(get: '/api/stores/2/categories').to route_to(
      controller: 'api/v1/categories',
      action: 'index',
      store_id: '2',
      format: 'json'
    )
  end

  it 'show' do
    expect(get: '/api/stores/2/categories/3').not_to be_routable
  end

  it 'create' do
    expect(post: '/api/stores/2/categories').not_to be_routable
  end

  it 'edit' do
    expect(get: '/api/stores/2/categories/3/edit').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/stores/2/categories/3').not_to be_routable
  end

  it 'delete' do
    expect(delete: '/api/stores/2/categories/3').not_to be_routable
  end
end
