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

class SportsBarsController < ApplicationController

	def showing_game_in_area
		@event_id = params[:event_id]
		
		respond_to do |format|
			format.html
			format.json { render json: @geojson }  # respond with the created JSON object
		end
	end

end
