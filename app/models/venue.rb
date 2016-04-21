# == Schema Information
#
# Table name: venues
#
#  id             :integer          not null, primary key
#  abbreviation   :string
#  city           :string
#  country        :string
#  field_type     :string
#  latitude       :float
#  longitude      :float
#  name           :string
#  slug           :string
#  state          :string
#  time_zone      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stattleship_id :string
#

class Venue < ActiveRecord::Base
  belongs_to :team
  belongs_to :game
end
