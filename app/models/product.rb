class Product < ActiveRecord::Base
  extend FriendlyId

  include Tire::Model::Search
  include Tire::Model::Callbacks

  after_create :get_new_media
  after_update :get_product_media
  
  belongs_to :garage, counter_cache: true
  has_many :medias

  validates :name, presence: true
  validates :value, presence: true
  validates :currency, presence: true
  after_validation :validate_currency

  friendly_id :name, use: :slugged
  acts_as_votable

  # mapping do
  #   indexes :id, type: 'integer'
  #   indexes :garage_id, type: 'integer'
  #   indexes :name, boost: 10
  #   indexes :slug, boost: 10
  #   indexes :description
  #   indexes :value, type: 'value'
  #   indexes :currency, type: 'stirng'
  #   indexes :tags, type: 'string'
  #   indexes :media_count, type: 'integer'
  #   indexes :created_at, type: 'date'
  #   indexes :updated_at, type: 'date'
  # end

  def self.search(params)
    tire.search() do
      query do
        boolean do 
          must { string params[:query], default_operator: "OR" } if params[:query].present?
          # TODO create a filter for product status 
          #must { range :status eq 10}
        end
      end
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

  def user
    garage.user
  end

  def garage_name
    garage.name
  end

  private

    def validate_currency
      begin
        Money.new(self.value*100, self.currency)
      rescue Exception => e
        self.update_attribute(:currency, 'USD')
      end
    end

    def get_new_media
      media = Media.new_media_for self.user, nil
      media.each { |m|  m.update_attributes(product: self, new_product: false)}
    end

    def get_product_media
      media = Media.new_media_for self.user, self
      media.each { |m|  m.update_attributes(new_product: false)}
    end
end
