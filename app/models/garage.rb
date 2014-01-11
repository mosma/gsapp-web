class Garage < ActiveRecord::Base
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
  
end
