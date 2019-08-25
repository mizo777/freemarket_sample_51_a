$(function(){
  $('.item-container__buttons--left__like-btn').on('click', function() {
    $(this).css({'border':'1px solid #ea352d','background': 'none'});
    $('.item-container__buttons--left__like-btn__text').css('color', '#ea352d');
    $('.item-container__buttons--left__like-btn__count').css('color', '#ea352d');
    $('.heart-2').css('color', '#ea352d');
  });
});