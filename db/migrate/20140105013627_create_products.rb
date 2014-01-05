class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :garage, index: true
      t.string :name, null: false
      t.string :slug
      t.text :description
      t.float :value, default: 0
      t.string :currency, null: false
      t.string :tags, array: true, default: []

      t.integer :media_count

      t.timestamps
    end
  end
end
