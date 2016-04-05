# == Schema Information
#
# Table name: sports_bars
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  hashtag        :string(255)
#  description    :text(65535)
#  logo           :string(255)
#  owner_id       :integer
#  email          :string(255)
#  website        :string(255)
#  facebook_page  :string(255)
#  twitter_handle :string(255)
#  permalink      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class SportsBarTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
