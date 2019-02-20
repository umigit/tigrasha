$(function(){
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
