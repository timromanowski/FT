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

module GamesHelper
end
