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
  is_impressionable

  has_many :messages

  #enum status: [ :available, :unavailable, :invisible, :sold, :on_hold, :rejected, :deleted ]
  STATUS = { available: 0, unavailable: 1, invisible: 2, sold: 3,
    on_hold: 4, rejected: 5, deleted: 6 }

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

  def self.search(params, page)
    tire.search(page: page, per_page: 20) do
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
    to_json :methods => [:garage_name, :image, :garage_location]
  end

  def image(img = :medium)
    if medias.size == 0
      return "/img/product_missing.png"
    end
    medias.first.image.url(img)
  end

  def user
    garage.user
  end

  def garage_name
    garage.name
  end

  def garage_location
    [
      garage.latitude,
      garage.longitude,
      garage.street,
      garage.city,
      garage.state,
      garage.country
    ]
  end

  def available_status
    [
      ['Available', STATUS[:available]],
      ['Unavailable', STATUS[:unavailable]],
      ['Sold', STATUS[:sold]],
      ['Invisible', STATUS[:invisible]],
      ['On Hold', STATUS[:on_hold]],
    ]
  end

  def is_available?
    self.status == STATUS[:available]
  end
  def is_unavailable?
    self.status == STATUS[:unavailable]
  end
  def is_invisible?
    self.status == STATUS[:invisible]
  end
  def is_sold?
    self.status == STATUS[:sold]
  end
  def is_on_hold?
    self.status == STATUS[:on_hold]
  end
  def is_rejected?
    self.status == STATUS[:rejected]
  end
  def is_deleted?
    self.status == STATUS[:deleted]
  end

  def brief_statistic_data
    {
      unique_views: {
        total: self.impressionist_count(:filter=>:session_hash),
        last_week: self.impressionist_count(:filter=>:session_hash,:start_date=>1.week.ago,:end_date=>Time.now)
      },
      page_views: {
        total: self.impressionist_count,
        last_week: self.impressionist_count(:start_date=>1.week.ago,:end_date=>Time.now)
      },
      likes: {
        total: self.votes.size,
        last_week: self.votes.where(["created_at > ?", 1.week.ago]).size
      }
    }
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
