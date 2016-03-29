# == Schema Information
#
# Table name: sports_subscriptions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  logo_file  :string(255)
#  provider   :string(255)
#  league_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SportsSubscription < ActiveRecord::Base
  has_many :location_sports_subscription
  has_many :locations, :through => :location_sports_subscription
end
