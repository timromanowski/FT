# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	L.mapbox.accessToken = 'pk.eyJ1IjoidGltcm9tYW5vd3NraSIsImEiOiJjaW04bG5rYnYwMjZmdjBsdTh1NjMyNWVrIn0.V1uutJECEvBov61VRx7Xog'
	map = L.mapbox.map('map', 'mapbox.streets', { zoomControl: false } ).setView([45.52086, -122.679523], 14)
	map.scrollWheelZoom.disable();
	new L.Control.Zoom({ position: 'topright' }).addTo(map);
	L.control.locate({ position: 'bottomright' }).addTo(map)

	# get JSON object
	# on success, parse it and
	# hand it over to MapBox for mapping
	$.ajax
		data: {lat: 45.52086, lon:-122.679523}
		dataType: 'text'
		url: '/locations.json'
		success: (data) ->
			geojson = $.parseJSON(data)
			console.log(geojson)
			map.featureLayer.setGeoJSON(geojson)


