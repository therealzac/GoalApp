FactoryGirl.define do
  factory :goal do
    content "MyString"
    user_id Random::rand(10)
    status "pending"
    exposure "public"

    factory :completed_goal do
      content "MyString"
      user_id Random::rand(10)
      status "completed"
      exposure "public"
    end

    factory :private_goal do
      content "MyString"
      user_id Random::rand(10)
      status "pending"
      exposure "private"
    end
  end

end
