# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  label          :string(255)
#  name           :string(255)
#  slug           :string(255)
#  title          :string(255)
#  timestamp      :integer
#  started_at     :datetime
#  home_team_id   :integer
#  away_team_id   :integer
#  venue_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  stattleship_id :string(255)
#  league_id      :integer
#

class GamesController < ApplicationController
  
  def for_date
    # http://ruby-doc.org/stdlib-2.1.1/libdoc/time/rdoc/Time.html#method-c-parse
    @date = params[:date].nil? ?  nil : Time.parse( params[:date] )
    @games = @date.nil? ? Game.on_utc_date( @utc_date ) : Game.on_date( @date )   
    byebug
		respond_to do |format|
			format.html { render :partial => 'partials/gamelist' }
			format.json { render json: @games }  # respond with the created JSON object
		end
  end
  
end
