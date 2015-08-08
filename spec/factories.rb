FactoryGirl.define do

  factory :question do
    title         "Sample"
    description   "Sample"
    image         "Sample"
    answer        "Sample"
    level         1
  end

  factory :user do
    name                   "Test User"
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password               "password"
    password_confirmation  "password"
  end
end
