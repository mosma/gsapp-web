class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.attachment :image
      t.attachment :video
      t.string :descrition
      t.integer :order

      t.timestamps
    end
  end
end
