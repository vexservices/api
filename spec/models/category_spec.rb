require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to :store }
  it { should have_many :products }
  it { should have_many :categories }
end
