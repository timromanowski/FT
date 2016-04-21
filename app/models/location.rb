# == Schema Information
#
# Table name: locations
#
#  id                   :integer          not null, primary key
#  sport_bar_id         :integer
#  name                 :string
#  location_description :text
#  logo                 :string
#  address1             :string
#  address2             :string
#  city                 :string
#  region               :string
#  country              :string
#  postal_code          :string
#  latitude             :float
#  longitude            :float
#  phone_number         :string
#  email                :string
#  website              :string
#  facebook_page        :string
#  twitter_handle       :string
#  tv_count             :integer
#  permalink            :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Location < ActiveRecord::Base
  belongs_to :sports_bar
  has_many :location_sports_subscription
  has_many :sports_subscriptions, :through => :location_sports_subscription
  
  has_many :location_games
  has_many :games, :through => :location_games
  
  acts_as_mappable :default_units => :miles,
                     :default_formula => :sphere,
                     :distance_field_name => :distance,
                     :lat_column_name => :latitude,
                     :lng_column_name => :longitude
  #geocoded_by :address
  #after_validation :geocode, :if => :address_changed?
end
