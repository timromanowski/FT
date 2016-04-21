# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  label          :string
#  name           :string
#  slug           :string
#  title          :string
#  timestamp      :integer
#  started_at     :datetime
#  home_team_id   :integer
#  away_team_id   :integer
#  venue_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stattleship_id :string
#  league_id      :integer
#

class Game < ActiveRecord::Base
  belongs_to :league
  belongs_to :home_team, :class_name => 'Team', :foreign_key => 'home_team_id'
  belongs_to :away_team, :class_name => 'Team', :foreign_key => 'away_team_id'  
  has_many :location_games
  has_many :sports_bars, :through => :sports_bar_games 
  
  scope :on_today, -> { ( where('started_at between ? and ?', DateTime.now.utc, DateTime.now.utc.end_of_day)) }
  scope :on_utc_date, -> ( date ){ ( where('started_at between ? and ?', date.beginning_of_day, date.end_of_day)) }
  scope :on_date, -> ( date ){ ( where('started_at between ? and ?', date.beginning_of_day, date.end_of_day)) }
end
