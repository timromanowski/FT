$(function(){ 
	

    L.mapbox.accessToken = 'pk.eyJ1IjoidGltcm9tYW5vd3NraSIsImEiOiJjaW04bG5rYnYwMjZmdjBsdTh1NjMyNWVrIn0.V1uutJECEvBov61VRx7Xog';
    var map = L.mapbox.map('map', 'mapbox.streets', { zoomControl: false } ).setView([44.5647222, -123.2608333], 14);
    map.scrollWheelZoom.disable(); 


    var myLayer = L.mapbox.featureLayer().addTo(map)
    new L.Control.Zoom({ position: 'topright' }).addTo(map)
    L.control.locate({ position: 'bottomright' }).addTo(map)
            
    myLayer.on( 'layeradd', function(e) {
        marker = e.layer;
        properties = marker.feature.properties;
        
        popupContent =  '<div class="map_popup">' +
                        '<h3>' + properties.name + '</h3>' +
                        '<p>' + properties.address + '</p>' +
                        '</div>'

        marker.bindPopup(popupContent,{
                closeButton: false,
                minWidth: 320
        });
    });
        
	$.ajax({
        data: {lat: 44.5647222, lon:-123.2608333},
        dataType: 'text',
        url: '/locations.json',
        success: function(data){
            geojson = $.parseJSON(data);
            console.log(geojson);
            myLayer.setGeoJSON(geojson);
        }
    });
        
});


