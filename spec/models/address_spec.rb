require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to :store }

  it '#store_logo' do
    should delegate_method(:store_logo).to(:store).as(:logo)
  end

  it '#store_phone' do
    should delegate_method(:store_phone).to(:store).as(:phone)
  end

  it '#store_name' do
    should delegate_method(:store_name).to(:store).as(:name)
  end

  if '#store_formatted_name' do
    should delegate_method(:store_formatted_name).to(:store).as(:formatted_name)
  end

  if '#store_short_name' do
    should delegate_method(:store_short_name).to(:store).as(:short_name)
  end

  if '#store_search_name' do
    should delegate_method(:store_search_name).to(:store).as(:search_name)
  end

  it '#store_official_email' do
    should delegate_method(:store_official_email).to(:store).as(:official_email)
  end

  it '#store_website' do
    should delegate_method(:store_website).to(:store).as(:website)
  end

  it '#store_about' do
    should delegate_method(:store_about).to(:store).as(:about)
  end

  it '#store_corporate' do
    should delegate_method(:store_corporate).to(:store).as(:corporate)
  end
end
