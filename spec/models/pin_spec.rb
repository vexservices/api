require 'rails_helper'

RSpec.describe Pin, type: :model do
  let(:product) { create(:product) }
  let(:publish) { create(:publish, product: product) }
  let(:device)  { create(:device) }

  it { should belong_to :store }
  it { should belong_to :device }
  it { should belong_to :publish }
  it { should belong_to :product }
  it { should have_many :pictures }

  context '.copy_from_publish' do
    let(:pin) { Pin.copy_from_publish(publish, device) }

    it '#publish_id' do
      expect(pin.publish_id).to eq publish.id
    end

    it '#store_id' do
      expect(pin.store_id).to eq publish.store_id
    end

    it 'device_id' do
      expect(pin.device_id).to eq device.id
    end

    it '#product_id' do
      expect(pin.product_id).to eq product.id
    end

    it '#name' do
      expect(pin.name).to eq product.name
    end

    it '#category_name' do
      expect(pin.category_name).to eq product.category_name
    end

    it '#description' do
      expect(pin.description).to eq product.description
    end

    it '#contact_info' do
      expect(pin.contact_info).to eq product.contact_info
    end

    it '#regular_price' do
      expect(pin.regular_price).to eq product.regular_price
    end

    it '#price' do
      expect(pin.price).to eq publish.price
    end

    it '#store_name' do
      expect(pin.store_name).to eq publish.store_name
    end
  end
end
