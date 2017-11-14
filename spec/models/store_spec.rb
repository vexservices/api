require 'rails_helper'

RSpec.describe Store, type: :model do
  let(:store) { create(:store) }

  it { should belong_to :store }

  it { should have_one :address }
  it { should have_one :app }

  it { should have_many :devices }
  it { should have_many :stores }
  it { should have_many :categories }
  it { should have_many :publishes }
  it { should have_many :sections }
  it { should have_many :messages }

  it { should have_and_belong_to_many :departments }

  it '#app_test_mode?' do
    should delegate_method(:app_test_mode?).to(:app).as(:test_mode?)
  end

  it '#address_state' do
    should delegate_method(:address_state).to(:address).as(:state)
  end

  it '#address_city' do
    should delegate_method(:address_city).to(:address).as(:city)
  end

  it '#address_street' do
    should delegate_method(:address_street).to(:address).as(:street)
  end

  it '#address_zip' do
    should delegate_method(:address_zip).to(:address).as(:zip)
  end

  it '#address_latitude' do
    should delegate_method(:address_latitude).to(:address).as(:latitude)
  end

  it '#address_longitude' do
    should delegate_method(:address_longitude).to(:address).as(:longitude)
  end

  it '#money_currency' do
    expect(store.money_currency).to be_a Money::Currency
  end

  it '#money_delimiter' do
    expect(store.money_delimiter).to eq ','
  end

  it '#money_unit' do
    expect(store.money_unit).to eq '$'
  end

  it '#money_separator' do
    expect(store.money_separator).to eq '.'
  end
end
