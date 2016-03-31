class WelcomeController < ApplicationController
  def index
    @games = Game.on_date( DateTime.now )
    #on_today
  end
end
