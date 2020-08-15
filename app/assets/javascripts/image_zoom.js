$(document).on('turbolinks:load', function() {
  $('.image__list').click(function () {
    var $image = $(this).attr('src');
    $('.main__image').attr('src', $image);
  });
});