# == Schema Information
#
# Table name: locations
#
#  id                   :integer          not null, primary key
#  sport_bar_id         :integer
#  name                 :string
#  location_description :text
#  logo                 :string
#  address1             :string
#  address2             :string
#  city                 :string
#  region               :string
#  country              :string
#  postal_code          :string
#  latitude             :float
#  longitude            :float
#  phone_number         :string
#  email                :string
#  website              :string
#  facebook_page        :string
#  twitter_handle       :string
#  tv_count             :integer
#  permalink            :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class LocationsController < ApplicationController
  
  before_action :set_variant, only: [:show, :update, :destroy, :edit]

	def index
		@game_id = params[:game_id]
    @date = params[:date].nil? ? DateTime.now : Time.parse( params[:date] )
		get_loc( params )
		@locations = Location.within( @distance, :origin => @loc )

    marker = "#282a2d"
		@geojson = Array.new
		@locations.each do |location|
      next if location.longitude.nil? or location.latitude.nil?
      game_ids = []
      if !@date.nil?
        game_ids = location.games.on_date( @date ).map(&:id) 
      end     
      
      if @game_id and @game_id != ""
        marker = game_ids.include? @game_id ? '#282a2d' : '#bbb'
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
          'marker-color': marker,
					'marker-symbol': 'beer',
					'marker-size': 'medium'
				}
			}
		end
		respond_to do |format|
			format.html
			format.json { render json: @geojson }  # respond with the created JSON object
		end
	end
  
  def show
    @location = Location.find(params[:id])
    @date = params[:date].nil? ? DateTime.now : Time.parse( params[:date] )
    @games = Game.on_date( @date )
    @game_ids = @location.games.on_date( @date ).map(&:id) 
    respond_to do |format|      
      format.html do |variant|
         variant.modal { render partial: 'partials/location_modal_content'} 
         variant.none
       end
			format.json { render json: @location }  # respond with the created JSON object
		end
  end
  
  private 
  
  def set_variant
    request.variant = :modal if params[:variant] == 'modal'
  end
end
