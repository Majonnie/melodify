class CreateInstrumentImages < ActiveRecord::Migration[7.0]
  def change
    create_table :instrument_images, id: :bigint do |t|
      t.references :instrument, null: false, foreign_key: true, type: :bigint
      t.string :image, limit: 255

      t.timestamps
    end
  end
end
