FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end

  factory :user do
    email { generate :email }
    password "qwerty"
    password_confirmation "qwerty"
    first_name "Adam"
    last_name "Malyn"
  end
end
