FactoryBot.define do
  factory :exercise do
    title { 'Test Title' }
    author { create(:user) }
  end
end