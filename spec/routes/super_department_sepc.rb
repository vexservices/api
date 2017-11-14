require 'rails_helper'

RSpec.describe 'routing to super_departments', type: :routing do

  it 'index' do
    expect(get: '/api/super_departments').to route_to(
      controller: 'api/v1/super_departments',
      action: 'index',
      format: 'json'
    )
  end

  it 'show' do
    expect(get: '/api/super_departments').not_to be_routable
  end

  it 'edit' do
    expect(get: '/api/super_departments/edit').not_to be_routable
  end

  it 'create' do
    expect(post: '/api/super_departments').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/super_departments').not_to be_routable
  end

  it 'delete' do
    expect(delete: '/api/position').not_to be_routable
  end
end
