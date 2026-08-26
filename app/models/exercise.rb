class Exercise < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :exercise_instruments
  has_many :instruments, through: :exercise_instruments

  validates :title, presence: true
end
