class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"
      t.datetime "image_updated_at"

      t.string   "video_file_name"
      t.string   "video_content_type"
      t.integer  "video_file_size"
      t.datetime "video_updated_at"

      t.string :descrition
      t.integer :order

      t.timestamps
    end
  end
end
