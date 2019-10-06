$(document).on('turbolinks:load', function() {
  
  var countUpValue = 0;
  var id = document.getElementByClassName("item-container").getAttribute("data-id");

  //ユーザーによって、いいね！ボタンが既に押されているとき
  $('#like-btn-1').on('click', function() {
    countUpValue++;
    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      //ボタンを無効にする
      $(this).prop("disabled", true);
      //ボタンの色が変化する
      $(this).css({'border':'1px solid #ea352d','background': 'none'});
      $('#like-text').css('color', '#ea352d');
      $('#like-count').css('color', '#ea352d');
      $('.heart-2').css('color', '#ea352d');
      //いいね！が+1される
      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count+1);
      //フォーム送信後、ボタンを有効にし、フォームのactionとmethodを変更する
      $.when(
        $('.button_to').on('submit', function() {
          $(this).prop("disabled", false);
        })
      ).done(function() {
        var url = '/likes/' + id;
        var $form = document.getElementsByClassName("button_to")[0];
        $form.action = url;
        $form.method = "delete";
      });
    }
    //クリック回数が奇数回の時
    else {
      //ボタンを無効にする
      $(this).prop("disabled", true);
      //ボタンの色が変化する
      $(this).css({'border':'none','background': '#f5f5f5'});
      $('#like-text').css('color', '#333');
      $('#like-count').css('color', '#333');
      $('.heart-2').css('color', '#ccc');
      //いいね！が-1される
      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count-1);
      //フォーム送信後、ボタンを有効にし、フォームのactionとmethodを変更する
      $.when(
        $('.button_to').on('submit', function() {
          $(this).prop("disabled", false);
        })
      ).done(function() {
        var url = '/likes.' + id;
        var $form = document.getElementsByClassName("button_to")[0];
        $form.action = url;
        $form.method = "post";
      });
    }
  });

  //ユーザーが初めていいね！ボタンを押すとき
  $('#like-btn-2').on('click', function() {
    countUpValue++;
    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      //ボタンを無効にする
      $(this).prop("disabled", true);
      //ボタンの色が変化する
      $(this).css({'border':'none','background': '#f5f5f5'});
      $('#like-text').css('color', '#333');
      $('#like-count').css('color', '#333');
      $('.heart-2').css('color', '#ccc');
      //いいね！が-1される
      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count-1);
      //フォーム送信後、ボタンを有効にし、フォームのactionとmethodを変更する
      $.when(
        $('.button_to').on('submit', function() {
          $(this).prop("disabled", false);
        })
      ).done(function() {
        var url = '/likes.' + id;
        var $form = document.getElementsByClassName("button_to")[0];
        $form.action = url;
        $form.method = "post";
      });
    }
    //クリック回数が奇数回の時
    else {
      //ボタンを無効にする
      $(this).prop("disabled", true);
      //ボタンの色が変化する
      $(this).css({'border':'1px solid #ea352d','background': 'none'});
      $('#like-text').css('color', '#ea352d');
      $('#like-count').css('color', '#ea352d');
      $('.heart-2').css('color', '#ea352d');
      //いいね！が+1される
      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count+1);
      //フォーム送信後、ボタンを有効にし、フォームのactionとmethodを変更する
      $.when(
        $('.button_to').on('submit', function() {
          $(this).prop("disabled", false);
        })
      ).done(function() {
        var url = '/likes/' + id;
        var $form = document.getElementsByClassName("button_to")[0];
        $form.action = url;
        $form.method = "delete";
      });
    }
  });
});