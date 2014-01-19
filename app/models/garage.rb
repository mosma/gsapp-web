class Garage < ActiveRecord::Base
  after_validation :geocode
  
  extend FriendlyId

  include Tire::Model::Search
  include Tire::Model::Callbacks

  belongs_to :user
  has_many :products

  has_attached_file :avatar, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/img/garage_missing.jpg",
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  validates :name, presence: true

  geocoded_by :address
  friendly_id :name, use: :slugged
  acts_as_votable
  is_impressionable
  #enum status: [ :visible, :invisible, :on_hold, :rejected, :deleted ]
  STATUS = { visible: 0, invisible: 1, on_hold: 2, rejected: 3,
    deleted: 4 }

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query], default_operator: "OR" } if params[:query].present?
      # TODO create a filter for garage status
      #filter :range, published_at: {lte: Time.zone.now}
    end
  end

  def address
    [street, city, state, country].compact.join(', ')
  end

  def is_visible?
    self.status == STATUS[:visible]
  end
  def is_invisible?
    self.status == STATUS[:visible]
  end
  def is_on_hold?
    self.status == STATUS[:visible]
  end
  def is_rejected?
    self.status == STATUS[:visible]
  end
  def is_deleted?
    self.status == STATUS[:visible]
  end

  def available_status
    [
      ['Visible', STATUS[:visible]],
      ['Invisible', STATUS[:invisible]],
      ['On Hold', STATUS[:on_hold]],
    ]
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
end
