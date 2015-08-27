function initMap() {
  var lat = Number($('#jsLat').val());
  var lng = Number($('#jsLng').val());
  eventMap = new google.maps.Map(document.getElementById('eventMap'), {
    center: {lat: lat, lng: lng},
    zoom: 8
  });
}
