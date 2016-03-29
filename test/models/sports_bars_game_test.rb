# == Schema Information
#
# Table name: sports_bars_games
#
#  id            :integer          not null, primary key
#  sports_bar_id :integer
#  game_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class SportsBarsGameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
