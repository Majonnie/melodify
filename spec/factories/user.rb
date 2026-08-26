FactoryBot.define do
  factory :user do
    first_name { 'Jane' }
    last_name { 'Doe' }
    email { 'test@example.com' }
    password { 'password1' }
  end
end