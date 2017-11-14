require 'rails_helper'

RSpec.describe 'routing to messages', type: :routing do

  it 'index' do
    expect(get: '/api/stores/2/messages').to route_to(
      controller: 'api/v1/messages',
      action: 'index',
      store_id: '2',
      format: 'json'
    )
  end

  it 'index without store' do
    expect(get: '/api/messages').to route_to(
      controller: 'api/v1/messages',
      action: 'index',
      format: 'json'
    )
  end

  it 'create' do
    expect(post: '/api/stores/2/messages').to route_to(
      controller: 'api/v1/messages',
      action: 'create',
      store_id: '2',
      format: 'json'
    )
  end

  it 'unread' do
    expect(get: '/api/stores/2/messages/unread').to route_to(
      controller: 'api/v1/messages',
      action: 'unread',
      store_id: '2',
      format: 'json'
    )
  end
end
