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
  var id = $('.item-container').attr('data-id');

  $('#like-btn-1').on('click', function() {
    //var countUpValue = 0;
    // var form = $(this);
    // var url = $(this).attr('action');
    countUpValue++;
    console.log(countUpValue);
    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      // var url = $('.button_to').attr('action');
      // $('.button_to').attr({method: 'delete', action: url});
      $(this).css({'border':'1px solid #ea352d','background': 'none'});
      $('#like-text').css('color', '#ea352d');
      $('#like-count').css('color', '#ea352d');
      $('.heart-2').css('color', '#ea352d');
      var like_count = $('#like-count').text();
      like_count = parseInt(like_count);
      $('#like-count').text(like_count+1);

      $('.button_to').on('submit', function() {
        //var id = $('.item-container').attr('data-id');
        var url = '/likes/' + id;
        $('.button_to').removeattr('method action')
        $('.button_to').attr({method: 'delete', action: url});
      });
    }
    //クリック回数が奇数回の時
    else {
      $(this).css({'border':'none','background': '#f5f5f5'});
      $('#like-text').css('color', '#333');
      $('#like-count').css('color', '#333');
      $('.heart-2').css('color', '#ccc');
      // var product_id = $('.item-container').attr('data-id');
      // document.form.action = "/likes";
      // document.form.method = "post";
      // var url = '/likes.' + id;
      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count-1);

      $('.button_to').on('submit', function() {
        var url = '/likes.' + id;
        $('.button_to').removeattr('method action')
        $('.button_to').attr({method: 'post', action: url});
      });
    }
  });
  $('#like-btn-2').on('click', function() {
    var countUpValue = 0;
    countUpValue++;
    //クリック回数が偶数回の時
    if ( (countUpValue) % 2 == 0 ) {
      $(this).css({'border':'none','background': '#f5f5f5'});
      $('#like-text').css('color', '#333');
      $('#like-count').css('color', '#333');
      $('.heart-2').css('color', '#ccc');

      var count = $('#like-count').text();
      count = parseInt(count);
      $('#like-count').text(count-1);

      $('.button_to').on('submit', function() {
        var url = '/likes.' + id;
        $('.button_to').removeattr('method action')
        $('.button_to').attr({method: 'post', action: url});
      });
    }
    //クリック回数が奇数回の時
    else {
      var like_count = $('#like-count').text();
      like_count = parseInt(like_count);
      $('#like-count').text(like_count+1);
      $(this).css({'border':'1px solid #ea352d','background': 'none'});
      $('#like-text').css('color', '#ea352d');
      $('#like-count').css('color', '#ea352d');
      $('.heart-2').css('color', '#ea352d');
      //console.log(like_count);

      $('.button_to').on('submit', function() {
        //var id = $('.item-container').attr('data-id');
        var url = '/likes/' + id;
        $('.button_to').removeattr('method action')
        $('.button_to').attr({method: 'delete', action: url});
      });
    }
  });

  //$('.button_to').on('submit', function() {
    //$(this).prop("disabled", true);
    //$(this).css('pointer-events', 'none');
  //});
});