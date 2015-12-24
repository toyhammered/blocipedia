FactoryGirl.define do
  factory :wiki do
    title Faker::Book.title
    body Faker::Hipster.paragraph
    private false
    user
  end

end
