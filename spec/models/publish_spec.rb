require 'rails_helper'

RSpec.describe Publish, type: :model do
  it { should belong_to :product }
  it { should belong_to :store }

  it '#store_name' do
    should delegate_method(:store_name).to(:store).as(:name)
  end

  it '#store_formatted_name' do
    should delegate_method(:store_formatted_name).to(:store).as(:formatted_name)
  end

  it '#store_short_name' do
    should delegate_method(:store_short_name).to(:store).as(:short_name)
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
  it '#store_contact_button' do
    should delegate_method(:store_contact_button).to(:store).as(:contact_button)
  end

  it '#store_map_button' do
    should delegate_method(:store_map_button).to(:store).as(:map_button)
  end

  it '#store_chat_button' do
    should delegate_method(:store_chat_button).to(:store).as(:chat_button)
  end

  it '#store_waze_button' do
    should delegate_method(:store_waze_button).to(:store).as(:waze_button)
  end

  it '#store_favorite_button' do
    should delegate_method(:store_favorite_button).to(:store).as(:favorite_button)
  end

  it '#store_show_address' do
    should delegate_method(:store_show_address).to(:store).as(:show_address)
  end

  it '#store_show_on_map' do
    should delegate_method(:store_show_on_map).to(:store).as(:show_on_map)
  end

  it '#store_map_icon' do
    should delegate_method(:store_map_icon).to(:store).as(:map_icon)
  end

  it '#store_store_tab' do
    should delegate_method(:store_store_tab).to(:store).as(:store_tab)
  end

  it '#store_product_tab' do
    should delegate_method(:store_product_tab).to(:store).as(:product_tab)
  end

  it '#store_product_tab' do
    should delegate_method(:store_product_tab).to(:store).as(:product_tab)
  end

  it '#store_pdf_button_link' do
    should delegate_method(:store_pdf_button_link).to(:store).as(:pdf_button_link)
  end

  it '#store_video_button_link' do
    should delegate_method(:store_video_button_link).to(:store).as(:video_button_link)
  end

  it '#store_banner' do
    should delegate_method(:store_banner).to(:store).as(:banner)
  end

end
