$(document).on('turbolinks:load', function() {
  var price = $('#price-form').val();
  if(price >= 300){
    var fee = Math.floor(price / 10)
    $('#fee').text(fee);
    var profit = (price - fee).toLocaleString();
    $('#profit').text(profit);
  }else{
      $('#profit').text(price);
  }  
  $("#price-form").on("keyup",function(){
    var price = $('#price-form').val();
    if (price == "" || price.length >= 8){
      $('#fee').text("-");      
      $('#profit').text("-");      
    } else if (price >= 300){
    var fee = Math.floor(price / 10)
    $('#fee').text(fee);
    var profit = (price - fee).toLocaleString();
    $('#profit').text(profit);
    }
    else{
      $('#profit').text(price);
    }
  })
});
