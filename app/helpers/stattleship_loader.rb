module Stattleship
    
  class StattleshipLoader
    
    require 'dotenv'
    Dotenv.load
    
    SPORTS = ['basketball', 'football', 'hockey', 'baseball'].freeze
    
    def load_upcoming_games
      
      query_params = Stattleship::Params::HockeyGamesParams.new
      query_params.status = 'upcomming'
      games = Stattleship::HockeyGames.fetch(params: query_params)
      
    end
    
  end 
end
