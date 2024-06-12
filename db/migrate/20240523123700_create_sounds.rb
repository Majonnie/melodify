class CreateSounds < ActiveRecord::Migration[7.0]
  def change
    create_table :sounds, id: :bigint do |t|
      t.references :instrument, null: false, foreign_key: true, type: :bigint
      t.string :sound_file, limit: 255

      t.timestamps
    end
  end
end
