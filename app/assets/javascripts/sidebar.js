// マウスをhoverさせると、矢印アイコンが動く
$(document).on('turbolinks:load', function() {
  $(".nav-list").on("mouseover",function(){
    $('i', this).animate({
      "right": "13", 
    });
    $('i', this).css("color", "black");
  }).on("mouseout",function(){
    $('i', this).animate({
      "right": "16"
    });
    $('i', this).css("color", "");
  })

});
// 現在のページのサイドバーにactiveクラス追加
$(document).on('turbolinks:load', function() {
  var activeUrl = location.pathname;
  navList = $("#sidebar-active").find("a");
  navList.each(function(){
    if( $(this).attr("href") == activeUrl ) {
     $(this).parent('li').addClass("active");
   };
  });

});