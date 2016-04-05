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

require 'test_helper'

class LocationSportsSubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
