require 'rails_helper'

RSpec.describe Publish, type: :model do
  it { should belong_to :product }
  it { should belong_to :store }

  it '#store_name' do
    should delegate_method(:store_name).to(:store).as(:name)
  end

  it '#store_logo' do
    should delegate_method(:store_logo).to(:store).as(:logo)
  end

  it '#product_name' do
    should delegate_method(:product_name).to(:product).as(:name)
  end

  it '#product_regular_price' do
    should delegate_method(:product_regular_price).to(:product).as(:regular_price)
  end

  it '#product_description' do
    should delegate_method(:product_description).to(:product).as(:description)
  end

  it '#product_category_name' do
    should delegate_method(:product_category_name).to(:product).as(:category_name)
  end

  it '#product_image' do
    should delegate_method(:product_image).to(:product).as(:image)
  end

  it '#product_contact_info' do
    should delegate_method(:product_contact_info).to(:product).as(:contact_info)
  end

  it '#product_pictures' do
    should delegate_method(:product_pictures).to(:product).as(:pictures)
  end

  it '#product_payment_option' do
    should delegate_method(:product_payment_option).to(:product).as(:payment_option)
  end
end
