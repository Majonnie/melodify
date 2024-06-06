class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images, id: :bigint do |t|
      t.references :imageable, null: false, polymorphic: true
      t.string :image_file, limit: 255

      t.timestamps
    end
  end
end
