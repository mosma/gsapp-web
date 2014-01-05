class Product < ActiveRecord::Base
  extend FriendlyId
  
  belongs_to :garage, counter_cache: true

  friendly_id :name, use: :slugged

end
