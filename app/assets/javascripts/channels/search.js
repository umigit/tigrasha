$(function(){
  $(document).on("ajax:success", ".search__form", function(e) {
    $("#search-result").html(e.detail[2].response);
  });
});


