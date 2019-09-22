$(document).on('turbolinks:load', function() {
  $('#search_form').on('keyup', function() {
    var input = $('#search_form').val();
    $.ajax({
      type: 'GET',
      url: '/products/search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(products) {
      $('#search_result').empty()
      if (products.length !== 0 && input.length !== 0) {
        products.forEach(function(product){
          appendProduct(product);
        });
      }
      else if (input.length == 0) {

      }
      else {
      }
    })
    .fail(function(){
      alert('商品検索に失敗しました');
    })
  });
});

