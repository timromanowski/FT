# == Schema Information
#
# Table name: sports_subscriptions
#
#  id         :integer          not null, primary key
#  name       :string
#  logo_file  :string
#  provider   :string
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
