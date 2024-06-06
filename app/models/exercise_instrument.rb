class ExerciseInstrument < ApplicationRecord
  belongs_to :exercise
  belongs_to :instrument
end