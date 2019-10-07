$(document).on('turbolinks:load', function() {

  var countUpValue = 0;

  //いいね！ボタンの色が赤色に変化
  function turnRed() {
    $('.like-btn').css({'border':'1px solid #ea352d','background': 'none'});
    $('#like-text').css('color', '#ea352d');
    $('#like-count').css('color', '#ea352d');
    $('.heart-2').css('color', '#ea352d');
  }
  //いいね！ボタンの色が無色に変化
  function becomeColorless() {
    $('.like-btn').css({'border':'none','background': '#f5f5f5'});
    $('#like-text').css('color', '#333');
    $('#like-count').css('color', '#333');
    $('.heart-2').css('color', '#ccc');
  }
  //いいね！が＋１される
  function countUp() {
    var count = $('#like-count').text();
    count = parseInt(count);
    $('#like-count').text(count+1);
  }
  //いいね！がー１される
  function countDown() {
    var count = $('#like-count').text();
    count = parseInt(count);
    $('#like-count').text(count-1);
  }

  //いいね!が既にされているとき
  $('#like-btn-1').on('click', function() {

    //商品のidを取得
    var productContainer = document.getElementsByClassName("item-container")[0];
    var productId = productContainer.getAttribute("data-id");

    countUpValue++;

    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      turnRed();
      countUp();
      //リンクのpathとmethodが切り替わり、likes_controllerのアクションをcreateに変更
      var url = '/likes.' + productId;
      var link = document.getElementById('like-btn-1');
      link.setAttribute("href",url);
      link.setAttribute("data-method","post");
    }
    //クリック回数が奇数回の時
    else {
      becomeColorless();
      countDown();
      //リンクのpathとmethodが切り替わり、likes_controllerのアクションをdestroyに変更
      var url = '/likes/' + productId;
      var link = document.getElementById('like-btn-1');
      link.setAttribute("href",url);
      link.setAttribute("data-method","delete");
    }
  });

  //いいね！がされていないとき
  $('#like-btn-2').on('click', function() {

    //商品のidを取得
    var productContainer = document.getElementsByClassName("item-container")[0];
    var productId = productContainer.getAttribute("data-id");

    countUpValue++;

    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      becomeColorless();
      countDown();
      //リンクのpathとmethodが切り替わり、likes_controllerのアクションをdestroyに変更
      var url = '/likes/' + productId;
      var link = document.getElementById('like-btn-2');
      link.setAttribute("href",url);
      link.setAttribute("data-method","delete");
    }
    //クリック回数が奇数回の時
    else {
      turnRed();
      countUp();
      //リンクのpathとmethodが切り替わり、likes_controllerのアクションをcreateに変更
      var url = '/likes.' + productId;
      var link = document.getElementById('like-btn-2');
      link.setAttribute("href",url);
      link.setAttribute("data-method","post");
    }
  });
});