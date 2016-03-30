# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

json = ActiveSupport::JSON.decode(File.read('db/seeds/leagues.json'))

json.each do |a|
  #  stattleship_id :string(255)
  #  name           :string(255)
  #  slug           :string(255)
  #  abbreviation   :string(255)
  #  sport          :string(255)
  League.create!(
  :stattleship_id => a['stattleship_id'],
  :name => a['name'],
  :slug => a['slug'],
  :abbreviation => a['abbreviation'],
  :sport => a['sport'],
  :logo => a['logo']  
  )
end


json = ActiveSupport::JSON.decode(File.read('db/seeds/sports_subscription.json'))

json.each do |a|
  SportsSubscription.create!(a)
end

json = ActiveSupport::JSON.decode(File.read('db/seeds/sports_bars.json'))
json.each do |bar|
  
  #name           :string(255)
  #  hashtag        :string(255)
  #  description    :text(65535)
  #  logo           :string(255)
  #  owner_id       :integer
  #  email          :string(255)
  #  website        :string(255)
  #  facebook_page  :string(255)
  #  twitter_handle :string(255)
  sb = SportsBar.create!( 
                     :name => bar['name'],
                     :description => bar['description'],
                     :logo => bar['logo'],
                     :email => bar['contact_email'],
                     :website => bar['website'],
                     :facebook_page => bar['facebook_page'],
                     :twitter_handle => bar['twitter_handle'],
                     :permalink => bar['permalink']
   )
   
   #  sport_bar_id         :integer
   #  location_description :text(65535)
   #  logo                 :string(255)
   #  address1             :string(255)
   #  address2             :string(255)
   #  city                 :string(255)
   #  region               :string(255)
   #  country              :string(255)
   #  postal_code          :string(255)
   #  latitude             :float(24)
   #  longitude            :float(24)
   #  phone_number         :string(255)
   #  email                :string(255)
   #  website              :string(255)
   #  facebook_page        :string(255)
   #  twitter_handle       :string(255)
   #  tv_count             :integer
   #  permalink            :string(255)
   location = Location.create!( :sport_bar_id => sb.id, 
                                :name => bar['name'],
                                :location_description => bar['description'],
                                :logo => bar['logo'],
                                :email => bar['contact_email'],
                                :website => bar['website'],
                                :facebook_page => bar['facebook_page'],
                                :twitter_handle => bar['twitter_handle'],
                                :address1  => bar['street'],
                                :city => bar['locality'],
                                :region => bar['region'],
                                :country => bar['country'],
                                :postal_code => bar['postal_code'],
                                :latitude => bar['latitude'],
                                :longitude => bar['longitude'],
                                :phone_number => bar['phone_number'],
                                :permalink => bar['permalink'],
                                :tv_count => bar['tv_count']
   )
   
   
   loader = StattleshipHelper::Loader.new
   loader.load
   
  
end
