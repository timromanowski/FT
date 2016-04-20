
class StattleshipClient
   SPORTS = {
     'hockey' => 'hockey/nhl/games', 
     'basketball' => 'basketball/nba/games', 
     'football' => 'football/nfl/games',  
     'baseball' => 'baseball/mlb/games'}.freeze
   
  def initialize()
    #@base_uri = 'https://www.stattleship.com'
    #@path = path
    #@query = query
    @token = '711750262c2f4a0ee83f4cb0ee3d63e7'
  end
  
  def headers
    {
      'Accept' => 'application/vnd.stattleship.com; version=1',
      'Authorization' => "Token token=#{@token}",
      'Content-Type' => 'application/json',
      
    }
  end
  
  def params
    {      
      'status' => 'upcoming'
    }
  end
  
  def base_uri
    URI('https://www.stattleship.com')
  end
  
  def fetch( sport )
    @path = SPORTS[sport]
    response = http.request(endpoint)
    games = JSON.parse(response.body)
    return games
  rescue StandardError => e
    puts "HTTP Request failed (#{e.message})"
    raise e
  end
  
  def http
    Net::HTTP.new(base_uri.host, base_uri.port).tap do |http|
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    end
  end
  
  def url          
      "#{base_uri}/#{@path}?status=upcoming"
  end
  
  def endpoint
    Net::HTTP::Get.new(url, headers)
  end
end

module GamesRepresenter
  include Roar::JSON
  include Stattleship::Models

  collection :away_teams, extend: TeamRepresenter,
                          class: Team

  collection :home_teams, extend: TeamRepresenter,
                          class: Team

  collection :winning_teams, extend: TeamRepresenter,
                             class: Team

  collection :games, extend: GameRepresenter,
                     class: Game

  collection :leagues, extend: LeagueRepresenter,
                       class: League

  collection :officials, extend: OfficialRepresenter,
                         class: Official

  collection :seasons, extend: SeasonRepresenter,
                       class: Season

  collection :venues, extend: VenueRepresenter,
                      class: Venue
end

module TeamsRepresenter
  include Roar::JSON
  include Stattleship::Models

  collection :leagues, extend: LeagueRepresenter,
                       class: League

  collection :teams, extend: TeamRepresenter,
                     class: Team
end