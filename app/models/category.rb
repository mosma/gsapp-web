class Category < ActiveRecord::Base
  belongs_to :parent, :class_name => "Category"
  has_many :children, :foreign_key => "parent_id", :class_name => "Category"

  scope :root,  -> { where(:parent_id => nil).first }

  def all_parents
    data = []
    return data if parent.nil?
    data << parent.all_parents
    data << {id: parent.id, name: parent.name}
    data.flatten
  end

end
