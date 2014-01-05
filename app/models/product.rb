class Product < ActiveRecord::Base
  extend FriendlyId
  
  belongs_to :garage, counter_cache: true
  has_many :medias

  validates :name, presence: true
  validates :value, presence: true
  validates :currency, presence: true

  friendly_id :name, use: :slugged

  def image
    if medias.size == 0
      return "/img/product_missing.png"
    end
    medias.first.image
  end

end
