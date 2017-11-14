FactoryGirl.define do
  factory :device do
    store
    push_token { Faker::Number.number(18) }
    kind 1

    trait :android do
      kind 2
    end
  end
end
