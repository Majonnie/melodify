class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades, id: :bigint do |t|
      t.string :grade, limit: 255
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.references :exercise, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
