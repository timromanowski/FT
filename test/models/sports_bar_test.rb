# == Schema Information
#
# Table name: sports_bars
#
#  id             :integer          not null, primary key
#  name           :string
#  hashtag        :string
#  description    :text
#  logo           :string
#  owner_id       :integer
#  email          :string
#  website        :string
#  facebook_page  :string
#  twitter_handle :string
#  permalink      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class SportsBarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
