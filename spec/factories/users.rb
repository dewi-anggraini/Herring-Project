FactoryBot.define do
  factory :user do
    user_name { "test" }
    phone { "1234567" }
    email { "testing@sample.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
