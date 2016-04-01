# == Schema Information
#
# Table name: location_games
#
#  id          :integer          not null, primary key
#  location_id :integer
#  game_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LocationGame < ActiveRecord::Base
  belongs_to :game
  belongs_to :location
end
