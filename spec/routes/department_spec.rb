require 'rails_helper'

RSpec.describe 'routing to departments', type: :routing do

  it 'index' do
    expect(get: '/api/departments').to route_to(
      controller: 'api/v1/departments',
      action: 'index',
      format: 'json'
    )
  end

  it 'show' do
    expect(get: '/api/departments/2').not_to be_routable
  end

  it 'create' do
    expect(post: '/api/departments').not_to be_routable
  end

  it 'edit' do
    expect(get: '/api/departments/2/edit').not_to be_routable
  end

  it 'update' do
    expect(put: '/api/departments/2').not_to be_routable
  end

  it 'delete' do
    expect(delete: '/api/departments/2').not_to be_routable
  end
end
