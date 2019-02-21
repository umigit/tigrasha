$(function(){

});


function moveMapToLocation(latitude, longitude){

}

function InitializeGoogleMap(){
  var position = {lat: 35.0, lng:135.0};
  var zoom = 4;
  if (($("#map").data("latitude") && $("#map").data("longitude"))){
    position = {lat: $("#map").data("latitude"), lng: $("#map").data("longitude")};
    zoom = 14;
  }

  var markers = [];
  $("#map").height($("#map").width());
  map = new google.maps.Map($("#map")[0], {center: position, zoom: zoom});

  var marker = new google.maps.Marker({position: position, map: map});


  map.addListener('click', function(e){
    console.log(e.latLng);
    marker.setMap(null);
    marker = new google.maps.Marker({
      position: e.latLng,
      map: map
    });
    map.panTo(e.latLng);
    $("#locationField").val(e.latLng.toUrlValue());
  });

  if ($("#search-box").length){
    var input = $("#search-box");
    var searchBox = new google.maps.places.SearchBox(input[0]);

    searchBox.addListener('places_changed', function() {
      var places = searchBox.getPlaces();
      console.log('places_changed');
      console.log(places);
      if (places.length == 0) {
        return;
      }

      markers.forEach(function(marker) {
        marker.setMap(null);
      });
      markers = [];

      var bounds = new google.maps.LatLngBounds();
      places.forEach(function(place) {
        if (!place.geometry) {
          console.log("Returned place contains no geometry");
          return;
        }
        var icon = {
          url: place.icon,
          size: new google.maps.Size(71, 71),
          origin: new google.maps.Point(0, 0),
          anchor: new google.maps.Point(17, 34),
          scaledSize: new google.maps.Size(25, 25)
        };

        if (place.geometry.viewport) {
          // Only geocodes have viewport.
          bounds.union(place.geometry.viewport);
        } else {
          bounds.extend(place.geometry.location);
        }
      });
      map.fitBounds(bounds);
    });
  }

  if ($("#imageFile").length !== 0){
    google.maps.event.addDomListener($("#imageFile")[0], 'change', function(){
      console.log('file changed');
      var location = {lat: 0.0, lng: 0.0};

      if ($("#imageFile")[0].files.length){
        $("#imageFile").fileExif(function(exif){
          console.log(exif);
          var latitudeArray = exif["GPSLatitude"];
          var longitudeArray = exif["GPSLongitude"];

          if(latitudeArray && longitudeArray) {
            var latitude = latitudeArray[0] + latitudeArray[1] / 60 + latitudeArray[2] / 3600;
            var longitude = longitudeArray[0] + longitudeArray[1] / 60 + longitudeArray[2] / 3600;
            location = {lat: latitude, lng: longitude};
            console.log(location);
            $("#search-box").val("");
            $("#latitudeField").val(latitude);
            $("#longitudeField").val(longitude);

            marker.setMap(null);
            marker = new google.maps.Marker({
              position: location,
              map: map
            });

            map.panTo(location);
            map.setZoom(14);
          }
        });
      }
      else{
        $("#latutudeField").val(35.0);
        $("#longitudeField").val(135.0);
      }
    });
  }
}


$(document).on('turbolinks:load', function(){
  if ($("#map").length){
    InitializeGoogleMap();
  }

  if ($("form").length){
    $("form")[0].reset();
  }
});
