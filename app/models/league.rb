# == Schema Information
#
# Table name: leagues
#
#  id             :integer          not null, primary key
#  stattleship_id :string
#  name           :string
#  slug           :string
#  abbreviation   :string
#  sport          :string
#  logo           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class League < ActiveRecord::Base
  has_many :teams
  has_many :games
end
