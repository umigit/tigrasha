$(function(){
  $(document).on("ajax:success", ".search__form", function(e) {
    $("#search-result").html(e.detail[2].response);
  });

  $(document).on('ajax:success', ".button_to", function(event) {
    console.log('search.js');
    console.log(event.detail[2].response);
  });

  $(document).on('ajax:error', ".button_to", function(event) {
    console.log('<se></se>arch.js');
    console.log(event.detail[2].response);
  });
});


