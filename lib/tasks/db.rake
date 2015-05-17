namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_zones
    make_locations
    make_users_zones
  end

  def make_users
    99.times do |n|
      name = Faker::Name.name
      User.create!(name: name)
    end
  end

  def make_zones
    10.times do |n|
      name = Faker::Address.country
      Zone.create!(name: name)
    end
  end

  def make_locations
    zones = Zone.all
    zones.each do |zone|
      99.times do
        name = Faker::Address.city
        zone.locations.create!(name: name)
      end
    end
  end

  def make_users_zones
    users = User.all
    zones = Zone.all
    users.each { |user| user.entrance!(zones.sample)}
  end
end
