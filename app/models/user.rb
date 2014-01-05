class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :authentications, :dependent => :destroy
  has_one :garage
  accepts_nested_attributes_for :garage
  
  def update_auth_info (user, auth)
    self.update_attributes user
    token = self.authentications.find_or_initialize_by provider: auth[:provider], uid: auth[:uid]
    token.update_attributes auth
    end  
end
