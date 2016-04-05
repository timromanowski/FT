# == Schema Information
#
# Table name: sports_bars
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  hashtag        :string(255)
#  description    :text(65535)
#  logo           :string(255)
#  owner_id       :integer
#  email          :string(255)
#  website        :string(255)
#  facebook_page  :string(255)
#  twitter_handle :string(255)
#  permalink      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class SportsBar < ActiveRecord::Base
  has_many :locations
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
  has_many :sports_bar_games
  has_many :games, :through => :sports_bar_games  
end
