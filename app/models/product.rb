class Product < ActiveRecord::Base
  extend FriendlyId

  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  belongs_to :garage, counter_cache: true
  has_many :medias

  validates :name, presence: true
  validates :value, presence: true
  validates :currency, presence: true

  friendly_id :name, use: :slugged

  def self.search(params)
    tire.search() do
      query { string params[:query], default_operator: "OR" } if params[:query].present?
      # TODO create a filter for product status
      #filter :range, published_at: {lte: Time.zone.now}
    end
  end

  self.include_root_in_json = false
  def to_indexed_json
    to_json :methods => [:garage_name, :image]
  end

  def image
    if medias.size == 0
      return "/img/product_missing.png"
    end
    medias.first.image
  end

  def garage_name
    garage.name
  end
end
