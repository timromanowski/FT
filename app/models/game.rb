# == Schema Information
#
# Table name: games
#
#  id           :integer          not null, primary key
#  label        :string(255)
#  name         :string(255)
#  slug         :string(255)
#  title        :string(255)
#  timestamp    :integer
#  started_at   :datetime
#  home_team_id :integer
#  away_team_id :integer
#  venue_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Game < ActiveRecord::Base
  belongs_to :league
  has_many :home_team, :class_name => 'Team', :foreign_key => 'home_team_id'
  has_many :away_team, :class_name => 'Team', :foreign_key => 'away_team_id'
  
end
