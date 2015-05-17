class Zone < ActiveRecord::Base
  has_many :locations
  has_many :user_zones
  has_many :users, through: :user_zones
end
