$(document).ready(function() {
  $('body').on('click', '.thumbnail', toggleActiveThumbnail);
  $('body').on('click', '.thumbnail-lighttheme', toggleActiveThumbnailLighttheme);
  if($('.ceramique-images').length > 0) {replaceAAF()}
  $('#zoom01').elevateZoom({
    zoomType: "inner",
    cursor: "crosshair",
    scrollZoom : true
  });
});

function toggleActiveThumbnail(event) {
  // Thumbnail and img-front update
  $('.thumbnail').removeClass('active');
  var source = $(this).attr("src");
  $(this).addClass('active');
  $('.img-front').attr("src", source);
  $('.img-front').attr("data-zoom-image", source);

  // InnerZoom update : destroy then creates
  $('.zoomContainer').remove();
  $('#zoom01').removeData('elevateZoom');
  $('#zoom01').removeData('zoomImage');
  $('#zoom01').elevateZoom({
    zoomType: "inner",
    cursor: "crosshair",
    scrollZoom : true
  });
  replaceAAF()
}

function replaceAAF(event) {
  var largeurTotale = $('.ceramique-images').width() / 2
  var largeurPhoto = $('.img-front').width() / 2
  var offset = largeurTotale - largeurPhoto
  $('.aaflogo').css({
    left: offset,
  });
}

function toggleActiveThumbnailLighttheme(event) {
  // Thumbnail and img-front update
  $('.thumbnail-lighttheme').removeClass('active');
  var source = $(this).attr("src");
  $(this).addClass('active');
  $('.img-front-lighttheme').attr("src", source);
  $('.img-front-lighttheme').attr("data-zoom-image", source);

  // InnerZoom update : destroy then creates
  $('.zoomContainer').remove();
  $('#zoom01').removeData('elevateZoom');
  $('#zoom01').removeData('zoomImage');
  $('#zoom01').elevateZoom({
    zoomType: "inner",
    cursor: "crosshair",
    scrollZoom : true
  });
}
