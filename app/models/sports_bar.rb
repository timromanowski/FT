# == Schema Information
#
# Table name: sports_bars
#
#  id             :integer          not null, primary key
#  name           :string
#  hashtag        :string
#  description    :text
#  logo           :string
#  owner_id       :integer
#  email          :string
#  website        :string
#  facebook_page  :string
#  twitter_handle :string
#  permalink      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class SportsBar < ActiveRecord::Base
  has_many :locations
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
  has_many :sports_bar_games
  has_many :games, :through => :sports_bar_games  
end
