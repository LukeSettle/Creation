$(function() {
  $(function initializeMap() {
    var geocoder = new google.maps.Geocoder;
    var infowindow = new google.maps.InfoWindow;

    // map for each event
    $('#openMap').on('click', function(){
      var lat = Number($('#jsLat').val());
      var lng = Number($('#jsLng').val());
      var eventLatLng = {lat: lat, lng: lng}
      var eventMap = new google.maps.Map(document.getElementById('eventMap'), {
        center: eventLatLng,
        zoom: 8,
      });
      var eventMarker = new google.maps.Marker({
        position: eventLatLng,
        map: eventMap,
        title: "Your Event location"
      });
      geocoder.geocode({'location': eventLatLng}, function(results, status) {
        infowindow.setContent(results[0].formatted_address);
        infowindow.open(eventMap, eventMarker);
      });
    });

    // map for new event
    var map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: -33.8688, lng: 151.2195},
      zoom: 13,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });


    map.addListener('click', function(e) {
      placeMarkerAndPanTo(e.latLng, map);
      console.log(e)
      $('#event_latitude').val(e.latLng.G);
      $('#event_longitude').val(e.latLng.K);
      geocoder.geocode({'location': e.latLng}, function(results, status) {
        $('#event_address').val(results[0].formatted_address);
      });
    });


    function placeMarkerAndPanTo(latLng, map) {
      var marker = new google.maps.Marker({
        position: latLng,
        map: map
      });
      deleteMarkers();
      markers.push(marker);
      map.panTo(latLng);
    }

    // Sets the map on all markers in the array.
    function setMapOnAll(map) {
      for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
      }
    }

    function clearMarkers() {
      setMapOnAll(null);
    }

    // Shows any markers currently in the array.
    function showMarkers() {
      setMapOnAll(map);
    }

    // Deletes all markers in the array by removing references to them.
    function deleteMarkers() {
      clearMarkers();
      markers = [];
    }

    // Create the search box and link it to the UI element.
    var input = document.getElementById('pac-input');
    var searchBox = new google.maps.places.SearchBox(input);
    map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

    // Bias the SearchBox results towards current map's viewport.
    map.addListener('bounds_changed', function() {
      searchBox.setBounds(map.getBounds());
    });

    var markers = [];
    // Listen for the event fired when the user selects a prediction and retrieve
    // more details for that place.
    searchBox.addListener('places_changed', function() {
      var places = searchBox.getPlaces();

      if (places.length == 0) {
        return;
      }

      // Clear out the old markers.
      markers.forEach(function(marker) {
        marker.setMap(null);
      });
      markers = [];

      // For each place, get the icon, name and location.
      var bounds = new google.maps.LatLngBounds();
      places.forEach(function(place) {
        var icon = {
          url: place.icon,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(25, 25)
        };

        // Create a marker for each place.
        markers.push(new google.maps.Marker({
          map: map,
          icon: icon,
          title: place.name,
          position: place.geometry.location
        }));

        if (place.geometry.viewport) {
          // Only geocodes have viewport.
          bounds.union(place.geometry.viewport);
        } else {
          bounds.extend(place.geometry.location);
        }
      });
      map.fitBounds(bounds);
    });
  });
});
