FactoryGirl.define do
  factory :store do
    address

    name  { Faker::Company.name }
    phone { Faker::PhoneNumber.cell_phone }
    time_zone 'UTC'
    token { SecureRandom.hex }
    number { Faker::Number.number(5) }
    corporate true
    currency 'USD'

    trait :branch_store do
      corporate false
    end
  end
end
