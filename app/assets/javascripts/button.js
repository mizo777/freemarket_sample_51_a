$(document).on('turbolinks:load', function() {
  $('.like-btn').on('click', function() {
    $(this).css({'border':'1px solid #ea352d','background': 'none'});
    $('#like-text').css('color', '#ea352d');
    $('#like-count').css('color', '#ea352d');
    $('.heart-2').css('color', '#ea352d');
    var count = $('#like-count').text();
    count = parseInt(count);
    $('#like-count').text(count+1);
    console.log(count);
  });
  $('.button_to').on('submit', function() {
    //$(this).prop("disabled", true);
    $(this).css('pointer-events', 'none');
  });
});
// $(function(){
//   $('.like-btn').on('submit', function() {
//     $(this).prop("disabled", true);
//     $('.like-btn').css('pointer-events', 'none');
//   });
// });
