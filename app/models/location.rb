# == Schema Information
#
# Table name: locations
#
#  id                   :integer          not null, primary key
#  sport_bar_id         :integer
#  location_description :text(65535)
#  address1             :string(255)
#  address2             :string(255)
#  city                 :string(255)
#  region               :string(255)
#  country              :string(255)
#  postal_code          :string(255)
#  latitude             :float(24)
#  longitude            :float(24)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Location < ActiveRecord::Base
  belongs_to :sports_bar
end
