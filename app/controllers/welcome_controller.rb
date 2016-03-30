class WelcomeController < ApplicationController
  def index
    @games = Game.on_today
  end
end
