require 'rails_helper'

RSpec.describe Department, type: :model do
  it { should belong_to :store }
  it { should belong_to :department }
  it { should have_many :departments }
  it { should have_and_belong_to_many :stores }
end
