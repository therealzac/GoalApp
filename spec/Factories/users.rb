FactoryGirl.define do
  factory :user do
      username { Faker::Internet.user_name }
      password "password"
      # association :goals, factory: :goal
  end

end
