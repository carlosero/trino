$(document).ready(function() {
  $("a#show_external_links").click(function(e) {
    if (is_inside_clients()) {
      e.preventDefault();
      e.stopPropagation();
      $('div#main-container').attr("class", "span6");
      $('div#half-container').attr("class", "span6");
      $('div#half-container').css("display", "inherit");
      $('#action-column').remove();
    }
  });

  $('a#external_link').click(function(e) {
    e.preventDefault();
    width = $('div#half-container').width();
    height = $('div#half-container').height();
    $('a#action-button').css("display", "none")
    $('div#half-container').html('<iframe src="'+this.href+'" frameborder="0" width="'+width+'" height="'+height+'"></iframe>')
  });
});

function is_inside_clients() {
  title = $("div#main-container").find("h1").find("span").html();
  if (title == "Clientes" || title == "Cliente") {
    return true;
  } else {return false;}
}