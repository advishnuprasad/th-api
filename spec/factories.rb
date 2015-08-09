FactoryGirl.define do
  factory :user_answer do
    user
    question
  end

  factory :question do
    title         "Sample"
    description   "Sample"
    image         File.open(Rails.root.join('spec', 'support', 'images.jpg'))
    answer        "Sample"
    level         1
  end

  factory :user do
    email                  "person#{Random.rand}@example.com"
    password               "password"
    password_confirmation  "password"
  end
end
