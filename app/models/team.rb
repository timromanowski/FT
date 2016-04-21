# == Schema Information
#
# Table name: teams
#
#  id             :integer          not null, primary key
#  hashtag        :string
#  league_id      :integer
#  venue_id       :integer
#  location       :string
#  latitude       :float
#  longitude      :float
#  name           :string
#  nickname       :string
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stattleship_id :string
#

class Team < ActiveRecord::Base
  belongs_to :league
  has_many :games
end
