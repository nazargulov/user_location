class User < ActiveRecord::Base
  has_many :user_zones
  has_many :zones, through: :user_zones
  has_many :locations, through: :zones

  def entrance!(zone)
    user_zones.create!(zone_id: zone.id)
  end
end
