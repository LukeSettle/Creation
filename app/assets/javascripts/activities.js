var lat = $('#jsLat').val();
var lng = $('#jsLng').val();
var eventMap;
function initMap() {
  eventMap = new google.maps.Map(document.getElementById('eventMap'), {
    center: {lat: parseInt(lat), lng: parseInt(lng)},
    zoom: 8
  });
}
