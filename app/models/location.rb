# == Schema Information
#
# Table name: locations
#
#  id                   :integer          not null, primary key
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
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Location < ActiveRecord::Base
  belongs_to :sports_bar
  has_many :location_sports_subscription
  has_many :sports_subscriptions, :through => :location_sports_subscription
  
  acts_as_mappable :default_units => :miles,
                     :default_formula => :sphere,
                     :distance_field_name => :distance,
                     :lat_column_name => :latitude,
                     :lng_column_name => :longitude
  #geocoded_by :address
  #after_validation :geocode, :if => :address_changed?
end
