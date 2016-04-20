# == Schema Information
#
# Table name: locations
#
#  id                   :integer          not null, primary key
#  sport_bar_id         :integer
#  name                 :string(255)
#  location_description :text(65535)
#  logo                 :string(255)
#  address1             :string(255)
#  address2             :string(255)
#  city                 :string(255)
#  region               :string(255)
#  country              :string(255)
#  postal_code          :string(255)
#  latitude             :float(24)
#  longitude            :float(24)
#  phone_number         :string(255)
#  email                :string(255)
#  website              :string(255)
#  facebook_page        :string(255)
#  twitter_handle       :string(255)
#  tv_count             :integer
#  permalink            :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
