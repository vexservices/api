FactoryGirl.define do
  factory :address do
    street    { Faker::Address.street_address }
    city      { Faker::Address.city }
    state     { Faker::Address.state }
    zip       { Faker::Address.zip_code }
    country   { Faker::Address.country }
    longitude { Faker::Address.longitude }
    latitude  { Faker::Address.latitude }

    trait :eiffel_tower do
      latitude 48.858093
      longitude 2.294694
      street 'Champ de Mars, 5 Avenue Anatole France'
      address 'Champ de Mars, 5 Avenue Anatole France'
    end

    trait :chez_ribe do
      latitude 48.85837
      longitude 2.294481
      street '15 Avenue de Suffren, 75007 Paris'
      address '15 Avenue de Suffren, 75007 Paris'
    end

    trait :jessica_art_gallery do
      latitude  48.85837
      longitude 2.294422
      street '14 Avenue de la Bourdonnais, 75007 Paris'
      address '14 Avenue de la Bourdonnais, 75007 Paris'
    end
  end
end
