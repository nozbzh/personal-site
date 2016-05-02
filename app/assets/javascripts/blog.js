$(".pages.blog").ready(function() {
  $(".line-numbers > a").text(function(_, oldText) {
    return oldText + ' ';
  });
});
