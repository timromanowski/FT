var key = L.mapbox.accessToken = mb;
var map = L.mapbox.map('map', 'mapbox.streets', { zoomControl: false } )
var geocoder = L.mapbox.geocoder('mapbox.places');
var myLayer = L.mapbox.featureLayer().addTo(map);
var geoJson = "";
var visible = null;
var last_lat = 44.5647222;
var last_lon = -123.2608333;

function changeMap(lat, lon, game_id){
	last_lat = lat;
	last_lon = lon;
    map.setView([lat, lon], 12);  
	$.ajax({
        data: {lat: lat, lon:lon, game_id:game_id },
        dataType: 'text',
        url: '/locations.json',
        success: function(data){
            geoJson = $.parseJSON(data);
            myLayer.setGeoJSON(geoJson);
        }
    });
}

function hasGameOn(game_id) {
    for (var i = 0; i < geoJson.length; i++) {
        games = geoJson[i].properties['game_ids'];
        if (games.indexOf(game_id) < 0) {
            geoJson[i].properties['marker-color'] = geoJson[i].properties['marker-grey-color'];
        }
        myLayer.setGeoJSON(geoJson);  
    }
};

$(function(){    
    
    $('#date_select').fdatepicker({
        format: 'mm/dd/yyyy'
    }).on('changeDate', function (ev) {
        var date = ev.date.getUTCDate() + '/' + ev.date.getUTCMonth() + '/' + ev.date.getUTCFullYear() + ' 00:00:00 -0500';
       $.ajax({
            data: {date:date},
            dataType: 'text',
            url: '/games/for_date',
            success: function(data){
                $('.games').fadeOut('slow', function() {
                    $('.games').html(data);
                    $('.games').fadeIn('slow');
                });               
            }
        });
    });
    map.scrollWheelZoom.disable();     
    new L.Control.Zoom({ position: 'bottomright' }).addTo(map);
    //var lc =L.control.locate({ position: 'bottomright'}).addTo(map);
            
    myLayer.on( 'layeradd', function(e) {
        marker = e.layer;
        properties = marker.feature.properties;
        
        popupContent =  '<div class="map_popup">';
        
        
        if( properties.logo ){
            popupContent +=     '<div class="logo">';
            popupContent +=         '<img src="'+ properties.logo + '" height="22" />';
            popupContent +=     '</div>';
        }
        
        var tvCount = 'NA';
        var toolTip = "Unknown number of TVs available";
        if(  properties.tv_count > 0 ){
            tvCount =  properties.tv_count;
            toolTip = tvCount + ' TVs available';
        }
        
        popupContent +=     '<div class="info">' +       
                                '<h2 class="popup-title">' + properties.name + '</h3>' +
                                '<p class="address">' + properties.address + '</p>' +
                                '<span data-tooltip aria-haspopup="true" class="has-tip" title="'+ toolTip + '">' + 
                                '<p class="tv_count"><i class="fi-monitor small"></i>' + tvCount + '</p>' +
                                '</span>' + 
                            '</div>' +
                            '<div class="arrow"></div>' +
                        '</div>';

        marker.bindPopup(popupContent,{
                closeButton: false,
                minWidth: 320
        });        
        
    });
    
    $("#changemap").click(function(){
        var postalCode = $(".search-field").val();
		if( postalCode != "" ){		
	        geocoder.query(postalCode, function(err, data) {
				if( err || !data ){
					return;
				}
	            // The geocoder can return an area, like a city, or a
	            // point, like an address. Here we handle both cases,
	            // by fitting the map bounds to an area or zooming to a point.
	            if (data.lbounds) {
	                map.fitBounds(data.lbounds);
	            }
	            if (data.latlng) {
					changeMap( data.latlng[0], data.latlng[1] );
	            }
	        });
		}
    });
    
    $('.search-field').keypress(function (e) {
     var key = e.which;
     if(key == 13)  // the enter key code
      {
        $("#changemap").click();
        return false;  
      }
    });
    
    $('#map').on('click', '.map_popup', function(e) {
		if( visible ){
		  var modal = $('#location-modal');
            $.ajax({
		        data: {variant: "modal" },
		        url: "locations/" + visible.properties.id		        
		    }).done(function(resp){
			  $('.location-modal-content').html(resp);			  
		      modal.foundation('open');
			  $('.location-modal-content').foundation();
			});
		}
    });
    
    myLayer.on('click', function(e) {
		visible = e.layer.feature;
        map.panTo(e.layer.getLatLng());
    });
    
    $( ".game_row" ).click( function(){
        //selected_game_id = $(this).attr( 'id' );
        //myLayer.eachLayer(function(entity) {
        //    games = entity.feature.properties['game_ids'];
        //    if (games.indexOf(selected_game_id) < 0) {
        //        entity.feature.properties['marker-color'] = "#hdhdhdh";
        //    }
        //});
        //hasGameOn($(this).attr( 'id' ));
		changeMap( last_lat, last_lon, $(this).attr( 'id' ) );
    });
    
    changeMap( last_lat, last_lon, null );
        
});


