$(function(){
  function ShowGoogleMap(latitude, longitude){
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers([
        {
          "lat": latitude,
          "lng": longitude,
          "picture": {
            "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
            "width":  32,
            "height": 32
          },
          "infowindow": "目撃場所"
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    });
  }


  $("#imageFile").on('change', function(event) {
    event.preventDefault();

    $(this).fileExif(function(exif){
      console.log(exif);
      var latitudeArray = exif["GPSLatitude"];
      var longitudeArray = exif["GPSLongitude"];

      if(latitudeArray && longitudeArray) {
        var latitude = latitudeArray[0] + latitudeArray[1] / 60 + latitudeArray[2] / 3600;
        var longitude = longitudeArray[0] + longitudeArray[1] / 60 + longitudeArray[2] / 3600;
        console.log(latitude);
        $("#addressField").val(latitude.toString() + "," + longitude.toString());
      }
    });
  });
});
