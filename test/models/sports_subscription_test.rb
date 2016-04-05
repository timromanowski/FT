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

require 'test_helper'

class SportsSubscriptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
