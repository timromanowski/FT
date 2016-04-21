# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  label          :string
#  name           :string
#  slug           :string
#  title          :string
#  timestamp      :integer
#  started_at     :datetime
#  home_team_id   :integer
#  away_team_id   :integer
#  venue_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stattleship_id :string
#  league_id      :integer
#

class GamesController < ApplicationController
  
  def for_date
    @date = params[:date].nil? ?  nil : Time.parse( params[:date] )
    @utc_date = params[:utc_date].nil? ? nil :  Time.parse( params[:utc_date] )
    @games = @date.nil? ? Game.on_utc_date( @utc_date ) : Game.on_date( @date )   
		respond_to do |format|
			format.html { render :partial => 'partials/gamelist' }
			format.json { render json: @games }  # respond with the created JSON object
		end
  end
  
end
