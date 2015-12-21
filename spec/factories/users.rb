FactoryGirl.define do
  pw = "password"

  factory :user do
    email { Faker::Internet.email }
    password pw
    password_confirmation pw
    confirmed_at Time.now
  end

end
