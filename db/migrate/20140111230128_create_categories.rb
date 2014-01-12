class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :parent, index: true
      t.string :name
      t.string :key
      t.text :tags

      t.timestamps
    end
  end
end
