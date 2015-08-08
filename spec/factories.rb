FactoryGirl.define do
  factory :user do
    name                   "Test User"
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password               "password"
    password_confirmation  "password"
  end
end
