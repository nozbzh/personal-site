$(".posts.index").ready(function() {
  $(".line-numbers > a").text(function(_, oldText) {
    return oldText + '| ';
  });
});


$(".posts.show").ready(function() {
  $(".redact img").addClass("img-responsive");
});
