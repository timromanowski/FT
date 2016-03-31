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

        '<div class="popup"><div class="logo"><span>food+drinks</span><img alt="Silverware" height="22" src="/assets/silverware-9d0a4d173d9e135f903fccb2d009de22.svg"><img alt="Glass" height="22" src="/assets/glass-9b07ca51d32a1325e6e433eae1e1612d.svg"></div><div class="info"><h3 class="popup-title">bluehour</h3><p class="hours">4:00pm–6:00pm</p><p class="address">250 nw 13th ave.</p></div><img alt="Right arrow" class="right-arrow" src="/assets/right-arrow-0d1ba3c494d476ab7d0906cf7e933e26.svg"></div>';
   

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


