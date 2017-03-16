FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    firstname Faker::Name.first_name
    surname Faker::Name.last_name
    password 'password'
    password_confirmation 'password'
  end
  
  factory :invalid_user, parent: :user do
    email nil
    firstname Faker::Name.first_name
    surname Faker::Name.last_name
    password 'password1'
    password_confirmation 'password'
  end
end
