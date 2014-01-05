class Garage < ActiveRecord::Base
  extend FriendlyId

  belongs_to :user
  has_many :products

  has_attached_file :avatar, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png"
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  geocoded_by :address
  friendly_id :name, use: :slugged

  def address
    [street, city, state, country].compact.join(', ')
  end
end
