class SportsBarsController < ApplicationController

	def showing_game_in_area
		@event_id = params[:event_id]
		
		respond_to do |format|
			format.html
			format.json { render json: @geojson }  # respond with the created JSON object
		end
	end

end
