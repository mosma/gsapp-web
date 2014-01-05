class CreateGarages < ActiveRecord::Migration
  def change
    create_table :garages do |t|
      t.references :user, index: true
      t.string :name
      t.string :slug
      t.text :description
      t.text :link
      t.string :tags, array: true, default: []

      t.string   "avatar_file_name"
      t.string   "avatar_content_type"
      t.integer  "avatar_file_size"
      t.datetime "avatar_updated_at"

      t.integer :products_count

      t.text :latitude
      t.text :longitude
      t.text :street
      t.text :city
      t.text :state
      t.text :country

      t.timestamps
    end
    add_index :garages, :slug, unique: true
  end
end
