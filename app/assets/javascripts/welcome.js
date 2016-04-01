var key = L.mapbox.accessToken = 'pk.eyJ1IjoidGltcm9tYW5vd3NraSIsImEiOiJjaW04bG5rYnYwMjZmdjBsdTh1NjMyNWVrIn0.V1uutJECEvBov61VRx7Xog';
var map = L.mapbox.map('map', 'mapbox.streets', { zoomControl: false } )
var geocoder = L.mapbox.geocoder('mapbox.places');
var myLayer = L.mapbox.featureLayer().addTo(map);

function changeMap(lat, lon){
    map.setView([lat, lon], 12);  
	$.ajax({
        data: {lat: lat, lon:lon},
        dataType: 'text',
        url: '/locations.json',
        success: function(data){
            geojson = $.parseJSON(data);
            myLayer.setGeoJSON(geojson);
        }
    });
}

$(function(){ 
    
    
    $('#date_select').fdatepicker().on('changeDate', function (ev) {
    	$.ajax({
            data: {date:ev.date},
            dataType: 'text',
            url: '/welcome/fordate',
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
        popupContent += '<div class="logo">';
        
        if( properties.logo ){
            popupContent += '<img src="'+ properties.logo + '" height="22" />';
        }
        popupContent += '</div>';
        popupContent += '<div class="info">' +       
                        '<h3 class="popup-title">' + properties.name + '</h3>' +
                        '<p class="address">' + properties.address + '</p>' +
                        '</div>';


        marker.bindPopup(popupContent,{
                closeButton: false,
                minWidth: 320
        });
    });
    
    $("#changemap").click(function(){
        var postalCode = $(".search-field").val();
        geocoder.query(postalCode, function(err, data) {
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
    });
    
    changeMap( 44.5647222, -123.2608333 );
        
});


