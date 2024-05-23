class CreateExerciseInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_instruments, id: :bigint do |t|
      t.references :exercise, null: false, foreign_key: true, type: :bigint
      t.references :instrument, null: false, foreign_key: true, type: :bigint
    end
  end
end
