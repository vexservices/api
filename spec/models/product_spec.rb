require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should belong_to :category }
  it { should belong_to :store }
  it { should have_many :pictures }
  it { should have_many :publishes }

  it '#category_name' do
    should delegate_method(:category_name).to(:category).as(:name)
  end
end
