class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :from, index: true
      t.references :to, index: true
      t.references :topic, index: true
      t.references :product, index: true
      t.text :message
      t.integer :status

      t.timestamps
    end
  end
end
