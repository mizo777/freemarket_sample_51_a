$(document).on('turbolinks:load', function() {

  var countUpValue = 0;

  //ユーザーによって、いいね！ボタンが既に押されているとき
  $('#like-btn-1').on('click', function() {
    var productContainer = document.getElementsByClassName("item-container")[0];
    var productId = productContainer.getAttribute("data-id");
    countUpValue++;
    console.log(countUpValue);
    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      //ボタンの色が変化する
      $(this).css({'border':'1px solid #ea352d','background': 'none'});
      $('#like-text').css('color', '#ea352d');
      $('#like-count').css('color', '#ea352d');
      $('.heart-2').css('color', '#ea352d');
      //いいね！が+1される
      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count+1);
      //リンクのpathとmethodが切り替わる
      var url = '/likes.' + productId;
      var link = document.getElementById('like-btn-1');
      link.setAttribute("href",url);
      link.setAttribute("data-method","post");
    }
    //クリック回数が奇数回の時
    else {
      //ボタンの色が変化する
      $(this).css({'border':'none','background': '#f5f5f5'});
      $('#like-text').css('color', '#333');
      $('#like-count').css('color', '#333');
      $('.heart-2').css('color', '#ccc');
      //いいね！が-1される
      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count-1);
      //リンクのpathとmethodが切り替わる
      var url = '/likes/' + productId;
      var link = document.getElementById('like-btn-1');
      link.setAttribute("href",url);
      link.setAttribute("data-method","delete");
    }
  });

  //ユーザーが初めていいね！ボタンを押すとき
  $('#like-btn-2').on('click', function() {
    var productContainer = document.getElementsByClassName("item-container")[0];
    var productId = productContainer.getAttribute("data-id");
    countUpValue++;

    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      //ボタンの色が変化する
      $(this).css({'border':'none','background': '#f5f5f5'});
      $('#like-text').css('color', '#333');
      $('#like-count').css('color', '#333');
      $('.heart-2').css('color', '#ccc');
      //いいね！が-1される
      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count-1);
      //リンクのpathとmethodが切り替わる
      var url = '/likes/' + productId;
      var link = document.getElementById('like-btn-2');
      link.setAttribute("href",url);
      link.setAttribute("data-method","delete");
    }
    //クリック回数が奇数回の時
    else {
      //ボタンの色が変化する
      $(this).css({'border':'1px solid #ea352d','background': 'none'});
      $('#like-text').css('color', '#ea352d');
      $('#like-count').css('color', '#ea352d');
      $('.heart-2').css('color', '#ea352d');
      //いいね！が+1される
      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count+1);
      //リンクのpathとmethodが切り替わる
      var url = '/likes.' + productId;
      var link = document.getElementById('like-btn-2');
      link.setAttribute("href",url);
      link.setAttribute("data-method","post");
    }
  });
});