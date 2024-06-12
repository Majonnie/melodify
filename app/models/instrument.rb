class Instrument < ApplicationRecord
  belongs_to :user
  has_many :exercise_instruments
  has_many :exercises, through: :exercise_instruments

  has_one :image, dependent: :destroy
  has_one :sound, dependent: :destroy

  def next_instrument
    self.class.where("id > ?", id).order(id: :asc).limit(1).first
  end

  def previous_instrument
    self.class.where("id < ?", id).order(id: :desc).limit(1).first
  end
end