require 'rails_helper'

RSpec.describe App, type: :model do
  it { should belong_to :store }
end
