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
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password               "password"
    password_confirmation  "password"
  end
end
