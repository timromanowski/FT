class LocationsController < ApplicationController

	def index
		@game_id = params[:game_id]
    @date = params[:date].nil? ? Date.today : Time.parse( params[:date] )
		get_loc( params )
		@locations = Location.within( @distance, :origin => @loc )

		@geojson = Array.new
		@locations.each do |location|
      
      game_ids = []
      if !@date.nil?
        game_ids = location.games.on_date( @date ).map(&:id) 
      end     
      
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
          tv_count: location.tv_count,
          logo: ActionController::Base.helpers.asset_path( location.logo ),
          game_date:@date,
          game_ids:game_ids,
					:'marker-color' => '#282a2d',
					:'marker-symbol' => 'beer',
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
