# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  hashtag        :string(255)
#  league_id      :integer
#  venue_id       :integer
#  location       :string(255)
#  latitude       :float(24)
#  longitude      :float(24)
#  name           :string(255)
#  nickname       :string(255)
#  slug           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stattleship_id :string(255)
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
