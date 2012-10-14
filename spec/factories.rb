FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
  end

  factory :reminder do
    content "Lorem ipsum"
    priority 1
    user
  end
end