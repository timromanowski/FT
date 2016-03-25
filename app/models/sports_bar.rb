# == Schema Information
#
# Table name: sports_bars
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  hashtag     :string(255)
#  description :text(65535)
#  address1    :string(255)
#  address2    :string(255)
#  city        :string(255)
#  region      :string(255)
#  country     :string(255)
#  postal_code :string(255)
#  latitude    :float(24)
#  longitude   :float(24)
#  owner_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class SportsBar < ActiveRecord::Base
  has_many :locations
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
end
