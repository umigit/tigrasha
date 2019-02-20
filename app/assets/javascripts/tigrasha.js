$(function(){
  function ShowGoogleMap(latitude, longitude){
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){

      markers = handler.addMarkers([
        {
          "lat": latitude,
          "lng": longitude,
          "infowindow": "目撃場所",
          // "picture": {
          //   "url": URL.createObjectURL($("#imageFile")[0].files[0]),
          //   "width":  200,
          //   "height": 200
          // },
        }
      ]);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(15);
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
        $("#map").height($("#map").width());
        ShowGoogleMap(latitude, longitude);
        $("#addressField").val(latitude.toString() + "," + longitude.toString());
      }
    });
  });
});
