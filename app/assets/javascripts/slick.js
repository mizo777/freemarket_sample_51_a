$(function(){
  $('.mercari-main__top').slick({
    accessibility: true,
    autoplay: true,
    autoplaySpeed: 3000,
    pauseOnDotsHover: true,
    dots: true,
    dotsClass: 'mercari-main__top__dots',
    slidesToShow: 1,
    slidesToScroll: 1,
    prevArrow: '<img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-prev.png" class="slide-arrow prev-arrow">',
    nextArrow: '<img src="https://www.mercari.com/jp/assets/img/common/jp/top/carousel-next.png" class="slide-arrow next-arrow">'
  });
});