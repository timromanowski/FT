# == Schema Information
#
# Table name: leagues
#
#  id             :integer          not null, primary key
#  stattleship_id :string(255)
#  name           :string(255)
#  slug           :string(255)
#  abbreviation   :string(255)
#  sport          :string(255)
#  logo           :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class League < ActiveRecord::Base
  has_many :teams
  has_many :games
end
