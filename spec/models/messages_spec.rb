require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:device) { build(:device) }

  it { should belong_to :store }
  it { should belong_to :device }

  it { should validate_presence_of :message }
end
