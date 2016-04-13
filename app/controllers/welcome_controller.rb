class WelcomeController < ApplicationController
  def index
    @date = DateTime.now
    @games = Game.on_date( @date )
    #on_today
  end
  
  
end
