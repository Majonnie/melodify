require "rails_helper"

RSpec.describe Exercise, type: :model do
  describe 'validations' do
    it 'is invalid without a title' do
      exercise = build(:exercise, title: nil)

      expect(exercise).not_to be_valid
      expect(exercise.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without an author' do
      exercise = build(:exercise, author: nil)

      expect(exercise).not_to be_valid
      expect(exercise.errors[:author]).to include('must exist')
    end

    it 'is valid with a title and an author' do
      exercise = Exercise.new(title: 'Tutorial', author: create(:user))

      expect(exercise).to be_valid
    end
  end

  # ...
end