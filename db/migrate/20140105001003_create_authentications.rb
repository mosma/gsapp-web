class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.references :user, index: true
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.string :name
      t.string :link
      t.string :avatar
      t.text :full_data

      t.timestamps
    end
  end
end
