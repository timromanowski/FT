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

class SportsBarsGame < ActiveRecord::Base
  belongs_to :game
  belongs_to :sports_bar
end
