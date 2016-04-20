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
          :'marker-highlight-color' => '#282a2d',
          :'marker-grey-color' => '#bbb',
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
