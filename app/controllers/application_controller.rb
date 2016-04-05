class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_loc( params )
    @lat = params[:lat]
    @lon = params[:lon]
    @distance = params[:distance].nil? ? 10 : params[:distance]
    #@address = params[:addresspicker]
    # if @address.nil? and current_user
    #   @address = current_user.postal_code
    # end
    @loc = Geokit::LatLng.new(params[:lat],params[:lon]) unless params[:lat].nil? or params[:lon].nil?
    
    # if ( @loc.nil? or ( @loc.lat == 0.0 and @loc.lng == 0.0 ) ) and !@address.nil?
    #   #return @sports_bars.within( @distance, :origin => @address )
    #   @loc = geo_code( @address )
    # end

    # if @loc.nil? and current_user and !current_user.latitude.nil?
    #   @loc = GeoKit::LatLng.new(current_user.latitude,current_user.longitude)
    # end
    
    if !@loc.nil?
      @lat = @loc.lat
      @lon = @loc.lng
    end
  end
end
