class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises, id: :bigint do |t|
      t.string :title, limit: 255
      t.references :author, null: false, foreign_key: { to_table: :users }, type: :bigint

      t.timestamps
    end
  end
end
