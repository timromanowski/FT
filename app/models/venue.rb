# == Schema Information
#
# Table name: venues
#
#  id             :integer          not null, primary key
#  abbreviation   :string(255)
#  city           :string(255)
#  country        :string(255)
#  field_type     :string(255)
#  latitude       :float(24)
#  longitude      :float(24)
#  name           :string(255)
#  slug           :string(255)
#  state          :string(255)
#  time_zone      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stattleship_id :string(255)
#

class Venue < ActiveRecord::Base
  belongs_to :team
  belongs_to :game
end
