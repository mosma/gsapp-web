class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :garage, index: true
      t.string :name
      t.string :slug
      t.text :description
      t.float :value
      t.string :currency
      t.string :tags, array: true, default: []

      t.integer :medias_count

      t.timestamps
    end
  end
end
