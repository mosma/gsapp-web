class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :garage, index: true
      t.string :name, null: false
      t.string :slug
      t.text :description
      t.float :value, default: 0
      t.string :currency, null: false
      t.string :link
      t.string :tags, array: true, default: []
      t.integer :status, default: 0

      t.integer :media_count

      t.timestamps
    end
    
    add_index  :products, :tags, using: 'gin'
  end
end
