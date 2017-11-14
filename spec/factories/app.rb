FactoryGirl.define do
  sequence :app_name do |n|
    "App Name #{n}"
  end

  factory :app do
    store

    name            { generate(:app_name) }
    apple_store_url { Faker::Internet.url }
    google_play_url { Faker::Internet.url }
    google_api_key  { Faker::Number.number(30) }
    use_logo true

    trait :authenticable do
      require_authentication true
    end
  end
end
