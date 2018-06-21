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

  it '#store_formatted_name' do
    should delegate_method(:store_formatted_name).to(:store).as(:formatted_name)
  end

  it '#store_short_name' do
    should delegate_method(:store_short_name).to(:store).as(:short_name)
  end

  it '#store_search_name' do
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
