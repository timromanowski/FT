# == Schema Information
#
# Table name: location_sports_subscriptions
#
#  id                     :integer          not null, primary key
#  location_id            :integer
#  sports_subscription_id :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class LocationSportsSubscription < ActiveRecord::Base
  belongs_to :location
  belongs_to :sports_scription
end
