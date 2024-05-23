class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments, id: :bigint do |t|
      t.string :name, limit: 255
      t.bigint :image_id
      t.bigint :sound_id
      t.references :user, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
