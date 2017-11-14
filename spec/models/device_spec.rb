require 'rails_helper'

RSpec.describe Device, type: :model do
  let(:device) { build(:device) }

  it { should belong_to :store }
  it { should have_many :pins }
  it { should have_many :streets }
  it { should have_many :messages }
  it { should have_and_belong_to_many :stores }
  it { should have_and_belong_to_many :departments }
  it { should accept_nested_attributes_for  :streets }

  it '#generate_token' do
    expect(device.token).to be_nil
  end

  it '#generate_token' do
    device.save

    expect(device.token).to_not be_nil
  end

  it '#default_radius' do
    expect(device.default_radius).to eq 2
  end

  it '#default_radius' do
    device.radius = 5
    expect(device.default_radius).to eq 5
  end
end
