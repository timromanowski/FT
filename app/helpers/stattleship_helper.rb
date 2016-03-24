require 'Stattleship'

module StattleshipHelper
  class Loader
    
    require 'dotenv'
    Dotenv.load
    
    SPORTS = ['hockey'].freeze #,'basketball', 'football',  'baseball'].freeze
    
    def games
        @games
    end
    
    def load
      byebug
      SPORTS.each do |sport|
        
        @games = schedule(sport: sport)
        byebug
        @games.each do |game|
          "#{game.name} in #{game.city}"
        end
      end
    end
    
    
    def schedule(sport: 'basketball', status: 'upcoming', team_id: nil, on: nil, count: 20)
            byebug
            
            query_params = Object.const_get("Stattleship::Params::#{sport.capitalize}GamesParams").new
            query_params.status = status
            query_params.team_id = team_id
            query_params.on = on

            Object.const_get("Stattleship::#{sport.capitalize}Games").
                      fetch(params: query_params).
                      last(count).
                      reverse
    end    
  end
end
