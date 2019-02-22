$(function(){
  var search_result = $("#search-result");

  function appendHTMLToSearchResult(sighting) {
    var html = `
      <div class = "col-lg-4 col-md-6 mb-4">
        <div class = "card bg-paper">
          <img src="sighting.image" class="img-thumbnail" />
            <div class="card-body">
              <p class="m-0">場所: #{sighting.place}</p>
              <p class="m-0">#{sighting.date.strftime("%Y年 %-m月 %-d日")}</p>
            </div>
        </div>
      </div>
    `;

    search_result.append(html);
  }
  // $(".search__form__submit").on('click', function(event) {
  //   event.preventDefault();
  //   var input = $(".search__form__input").val();
  //   console.log(input);
  //   $.ajax({
  //     url: '/sightings',
  //     type: 'GET',
  //     dataType: 'json',
  //     data: {keyword: 'input'},
  //   })
  //   .done(function(sightings) {
  //     search_result.empty();
  //     if (sightings.length !== 0){
  //       sightings.forEach(function(sighting){
  //         appendHTMLToSearchResult(sighting);
  //       });
  //     }
  //     console.log(sightings);
  //     console.log("success");
  //   })
  //   .fail(function() {
  //     console.log("error");
  //   })
  //   .always(function() {
  //     console.log("complete");
  //   });
  // });

  $(document).on("ajax:success", ".search__form", function(e) {
    console.log(e.detail[2].response);
    var response = e.detail[2].response;
    $("#search-result").html(response);
  });


});


