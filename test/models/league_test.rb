# == Schema Information
#
# Table name: leagues
#
#  id             :integer          not null, primary key
#  stattleship_id :string(255)
#  name           :string(255)
#  slug           :string(255)
#  abbreviation   :string(255)
#  sport          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
