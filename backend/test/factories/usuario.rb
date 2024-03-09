FactoryBot.define do
  factory :usuario do
    nome { Faker::Name.name }
    email { Faker::Internet.email }
    senha { "123456" }
    admin { false }

    trait :admin do
      admin { true }
    end
  end
end
