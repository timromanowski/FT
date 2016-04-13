class GamesController < ApplicationController
  
  def for_date
    byebug
    @date = params[:date].nil? ?  nil : Time.parse( params[:date] )
    @utc_date = params[:utc_date].nil? ? nil :  Time.parse( params[:utc_date] )
    @games = @date.nil? ? Game.on_utc_date( @utc_date ) : Game.on_date( @date )   
		respond_to do |format|
			format.html { render :partial => 'partials/gamelist' }
			format.json { render json: @games }  # respond with the created JSON object
		end
  end
  
end
