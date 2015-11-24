FactoryGirl.define do
  factory :goal do
    content {Faker::Lorem.sentence(5)}
    user_id Random::rand(10)
    status "pending"
    exposure "Public"
    # association :user, factory: :user

    factory :completed_goal do
      content {Faker::Lorem.sentence(5)}
      user_id Random::rand(10)
      status "completed"
      exposure "Public"
    end

    factory :private_goal do
      content {Faker::Lorem.sentence(5)}
      user_id Random::rand(10)
      status "pending"
      exposure "Private"
    end
  end

end
