$(document).on('turbolinks:load', function() {
  $("#delivery_burden").on("change",function(){
    $('#burden, .seller_deliverie,.buyer_deliverie').css('display', 'none');
    // 送料込み選択時
    var burdenValue = document.getElementById("delivery_burden").value;
    if (burdenValue == "送料込み(出品者負担)") {
      $(".seller_deliverie, #burden").css('display', 'block')
      // 着払い選択時
    } else if(burdenValue == "着払い(購入者負担)"){
      $(".buyer_deliverie, #burden").css('display', 'block')
    }
  })
});
