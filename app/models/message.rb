class Message < ActiveRecord::Base
  belongs_to :from, :class_name => "User"
  belongs_to :to, :class_name => "User"
  belongs_to :topic, :class_name => "Message"
  belongs_to :product
end
