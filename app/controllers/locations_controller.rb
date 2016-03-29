class LocationsController < ApplicationController

	def index
		@game_id = params[:game_id]
		get_loc( params )
		@locations = Location.within( @distance, :origin => @loc )

		@geojson = Array.new
		@locations.each do |location|
			@geojson << {
				type: 'Feature',
				geometry: {
					type: 'Point',
					coordinates: [location.longitude, location.latitude]
				},
				properties: {
					id:  location.id,
					name: location.name,
					address: location.address1,
					:'marker-color' => '#00607d',
					:'marker-symbol' => 'circle',
					:'marker-size' => 'medium'
				}
			}
		end
		respond_to do |format|
			format.html
			format.json { render json: @geojson }  # respond with the created JSON object
		end
	end
end
