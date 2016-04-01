class WelcomeController < ApplicationController
  def index
    @date = DateTime.now
    @games = Game.on_date( @date )
    #on_today
  end
  
  def fordate
    @date = Time.parse( params[:date] )
    @games = Game.on_date( @date )
    render :partial => 'partials/gamelist'
  end
end
