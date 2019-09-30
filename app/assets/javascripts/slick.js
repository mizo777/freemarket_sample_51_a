$(document).on('turbolinks:load', function(){
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
  $('.item-container__content__photo__top').slick({
    accessibility: true,
    autoplay: true,
    autoplaySpeed: 3000,
    pauseOnDotsHover: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    dots: true,
    dotsClass: 'item-container__content__photo__bottom',
    customPaging: function(slick,index) {
      // スライダーのインデックス番号に対応した画像のsrcを取得
      var targetImage = slick.$slides.eq(index).find('img').attr('src');
      // slick-dots > liの中に上記で取得した画像を設定
      return '<img src=" ' + targetImage + ' " alt="" width="60" height="60" class="item-container__content__photo__bottom__slick-image">';
    }
  });
  $('.item-container__content__photo__bottom__slick-image li').on('mouseover', function(e) {
    var $currTarget = $(e.currentTarget),
    index = $currTarget.data('slick-index'),
    slickObj = $('.item-container__content__photo__top').slick('getSlick');
    slickObj.slickGoTo(index, true);    // アニメーション中でも切り替える
    $slide.slick('slickPause');     // 自動切り替え停止
  })
  .on('mouseout', function(e) {
    $slide.slick('slickPlay');  // 自動切り替え再開
  });
});