FactoryGirl.define do
  factory :client do
    store

    name     { Faker::Company.name }
    username { Faker::Internet.email }
    blocked  false
    admin    false
    password '12345678'
    token    { SecureRandom.hex }
  end
end
