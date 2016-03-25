# == Schema Information
#
# Table name: sports_bars
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  hashtag     :string(255)
#  description :text(65535)
#  owner_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SportsBarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
