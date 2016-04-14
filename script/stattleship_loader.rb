#!/usr/bin/env ruby

ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")

require 'Stattleship'

  class StattleshipLoader
    
    require 'dotenv'
    Dotenv.load
    
    private
    
    SPORTS = ['hockey', 'basketball', 'football',  'baseball'].freeze
    
    @current_league
    @games
    
    def games
        @games
    end
    
    public 
    
    def load
      SPORTS.each do |sport|        
        league = nil
        @games = schedule(sport: sport)
        @games.each do |game|
          save_game( game )
        end
      end
    end
    
    private
    
    def save_game( stattleship_game )
      return if stattleship_game.nil? 
      
      p "#{stattleship_game.name} in #{stattleship_game.city}"
      
      game = Game.find_by_slug( stattleship_game.slug )
      if game.nil?
          
          league = get_league( stattleship_game.league )
          home_team = get_team( stattleship_game.home_team, league)
          away_team = get_team( stattleship_game.away_team, league )
          venue = get_venue( stattleship_game.venue )         
          
          #  label          :string(255)
          #  name           :string(255)
          #  slug           :string(255)
          #  title          :string(255)
          #  timestamp      :integer
          #  started_at     :datetime
          #  home_team_id   :integer
          #  away_team_id   :integer
          #  venue_id       :integer
          game = Game.create( label: stattleship_game.label, 
                              name: stattleship_game.name, 
                              stattleship_id: stattleship_game.id, 
                              slug: stattleship_game.slug,
                              title: stattleship_game.title,
                              timestamp: stattleship_game.timestamp,
                              started_at: stattleship_game.started_at,
                              league_id: league.id,
                              home_team_id: home_team.id,
                              away_team_id: away_team.id,
                              venue_id: venue.nil? ? nil : venue.id )          
          game.save! 
          p " -- SAVED"
      end      
    end
    
    def get_team( stattleship_team, league )
      return if stattleship_team.nil? 
      team = Team.find_by_slug( stattleship_team.slug ) 
      if team.nil?
        #  hashtag        :string(255)
        #  league_id      :integer
        #  venue_id       :integer
        #  location       :string(255)
        #  latitude       :float(24)
        #  longitude      :float(24)
        #  name           :string(255)
        #  nickname       :string(255)
        #  slug           :string(255)
        #  stattleship_id :string(255)
        venue = get_venue( stattleship_team.venue )
        team = Team.create( hashtag: stattleship_team.hashtag, 
                            league_id: league.id,
                            venue_id: venue.nil? ? nil : venue.id,
                            location:  stattleship_team.location,
                            latitude: stattleship_team.latitude,
                            longitude: stattleship_team.longitude,
                            name: stattleship_team.name,
                            nickname: stattleship_team.nickname,
                            slug: stattleship_team.slug,
                            stattleship_id: stattleship_team.id )
        team.save!
      end
      return team   
    end
    
    def get_venue( stattleship_venue )
      return if stattleship_venue.nil? 
      
      #  abbreviation   :string(255)
      #  city           :string(255)
      #  country        :string(255)
      #  field_type     :string(255)
      #  latitude       :float(24)
      #  longitude      :float(24)
      #  name           :string(255)
      #  slug           :string(255)
      #  state          :string(255)
      #  time_zone      :string(255)
      #  stattleship_id :string(255)
      venue = Venue.find_by_slug( stattleship_venue.slug ) 
      if venue.nil?
        venue = Venue.create( abbreviation: stattleship_venue.abbreviation,
                              city: stattleship_venue.city,
                              country: stattleship_venue.country,
                              field_type: stattleship_venue.field_type,
                              latitude: stattleship_venue.latitude,
                              longitude: stattleship_venue.longitude,
                              name: stattleship_venue.name,
                              slug: stattleship_venue.slug, 
                              state: stattleship_venue.state,
                              time_zone:stattleship_venue.time_zone,
                              stattleship_id:stattleship_venue.id
                              )
        venue.save!
      end
      return venue
      
    end
    
    def get_league( stattleship_league )
      return if stattleship_league.nil?   
      if @current_league.nil? or @current_league.stattleship_id != stattleship_league.id 
        @current_league = League.find_by_stattleship_id( stattleship_league.id )
        if @current_league.nil?
          @current_league = League.find_by_slug( stattleship_league.slug )
          if @current_league.nil?
            @current_league = League.create( stattleship_id: stattleship_league.id, 
                            name: stattleship_league.name, 
                            slug: stattleship_league.slug, 
                            abbreviation: stattleship_league.abbreviation,
                            sport: stattleship_league.sport )
            @current_league.save!
          else
            @current_league.stattleship_id = stattleship_league.id
            @current_league.save!
        end
        end
      end
      return @current_league
    end
    
    
    def schedule(sport: 'basketball', status: 'upcoming', team_id: nil, on: nil, count: 20)   
            
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
    loader = StattleshipLoader.new
    loader.load

