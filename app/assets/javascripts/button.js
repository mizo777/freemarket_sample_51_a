$(document).on('turbolinks:load', function() {
  
  // function appendLikeDestoryButton(product) {
  //   var html = `<form class="button_to" method="delete" action="/likes/${product.id}" data-id="${product.id}">
  //                 <button class="like-btn" id="like-btn-1" style="border: 1px solid #ea352d;background: none;" type="submit">
  //                   <i class="fas fa-heart heart-2" style="color: #ea352d"></i>
  //                   <span class="like-btn__text" id="like-text" style="color: #ea352d">いいね！</span>
  //                   <span class="like-btn__count" id="like-count" style="color: #ea352d">${product.likes_count}</span>
  //                 </button>
  //                 <input type="hidden" name="authenticity_token" value="XeP3xV/sDNEEyBzrYkWCtWVunAt/ps9HsuoE7uHGkKa4oGhGjPUW5JWJA0+QFlAJN94UspwfOTMgb5RhroD4cw==">
  //               </form>`;
  //   $('.item-container__buttons--left').append(html);
  // }

  // function appendLikeCreateButton(product) {
  //   var html = `<form class="button_to" method="post" action="/likes" data-id="${product.id}">
  //                 <button class="like-btn" id="like-btn-1" style="border: 1px solid #ea352d;background: none;" type="submit">
  //                   <i class="fas fa-heart heart-2" style="color: #ea352d"></i>
  //                   <span class="like-btn__text" id="like-text" style="color: #ea352d">いいね！</span>
  //                   <span class="like-btn__count" id="like-count" style="color: #ea352d">${product.likes_count}</span>
  //                 </button>
  //                 <input type="hidden" name="authenticity_token" value="XeP3xV/sDNEEyBzrYkWCtWVunAt/ps9HsuoE7uHGkKa4oGhGjPUW5JWJA0+QFlAJN94UspwfOTMgb5RhroD4cw==">
  //               </form>`;
  //   $('.item-container__buttons--left').append(html);
  // }
  
  var countUpValue = 0;
  var id = document.getElementByClassName("item-container").getAttribute("data-id");
  //var $form = document.getElementByClassName("button_to");

  $('#like-btn-1').on('click', function() {
    countUpValue++;
    console.log(countUpValue);
    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      $(this).css({'border':'1px solid #ea352d','background': 'none'});
      $('#like-text').css('color', '#ea352d');
      $('#like-count').css('color', '#ea352d');
      $('.heart-2').css('color', '#ea352d');

      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count+1);

      $.when(
        $('.button_to').on('submit', function() {
        })
      ).done(function() {
        var url = '/likes/' + id;
        var $form = document.getElementsByClassName("button_to");
        $form.action = url;
        $form.method = "delete";
      });
    }
    //クリック回数が奇数回の時
    else {
      $(this).css({'border':'none','background': '#f5f5f5'});
      $('#like-text').css('color', '#333');
      $('#like-count').css('color', '#333');
      $('.heart-2').css('color', '#ccc');

      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count-1);

      $.when(
        $('.button_to').on('submit', function() {
        })
      ).done(function() {
        var url = '/likes.' + id;
        var $form = document.getElementsByClassName("button_to");
        $form.action = url;
        $form.method = "post";
        //$('.button_to').removeAttr("method");
        //$('.button_to').attr("method", "POST");
        //$('.button_to').method = "post";
      });
    }
  });

  $('#like-btn-2').on('click', function() {
    countUpValue++;
    console.log(countUpValue);
    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      $(this).css({'border':'none','background': '#f5f5f5'});
      $('#like-text').css('color', '#333');
      $('#like-count').css('color', '#333');
      $('.heart-2').css('color', '#ccc');
      var url = '/likes/' + id;
      $('.button_to').removeAttr('method action')
      $('.button_to').attr({method: 'delete', action: url});

      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count-1);

      $.when(
        $('.button_to').on('submit', function() {
        })
      ).done(function() {
        var url = '/likes.' + id;
        var $form = document.getElementsByClassName("button_to");
        $form.action = url;
        $form.method = "post";
      });
    }
    //クリック回数が奇数回の時
    else {
      $(this).css({'border':'1px solid #ea352d','background': 'none'});
      $('#like-text').css('color', '#ea352d');
      $('#like-count').css('color', '#ea352d');
      $('.heart-2').css('color', '#ea352d');
      var url = '/likes.' + id;
      $('.button_to').removeAttr('method action')
      $('.button_to').attr({method: 'post', action: url});

      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count+1);

      $.when(
        $('.button_to').on('submit', function() {
        })
      ).done(function() {
        //var id = document.getElementByClassName("item-container").getAttribute("data-id");
        var url = '/likes/' + id;
        var $form = document.getElementsByClassName("button_to");
        $form.action = url;
        $form.method = "delete";
        //console.log($('.button_to').method);
        // $form.removeAttribute("action");
        // $form.setAttribute("action", url);
      });
    }
  });
});