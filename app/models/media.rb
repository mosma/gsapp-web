class Media < ActiveRecord::Base

  belongs_to :user
  belongs_to :product, counter_cache: true

  has_attached_file :image, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png",
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  has_attached_file :video, 
    :default_url => "/images/:style/missing_video.png",
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => image.url,
      "thumbnail_url" => image.url(:thumb),
      "new_product" => new_product,
      "delete_url" => medium_path(self),
      "delete_type" => "DELETE" 
    }
  end

  def self.new_media_for user, product
    return where(product: product, user: user) unless product.nil?
    where(new_product: true, user: user)
  end

end
