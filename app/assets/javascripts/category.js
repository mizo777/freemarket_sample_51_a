$(document).on('turbolinks:load', function() {
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;      
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='select-wrap' id='children_wrapper'>
                          <i class="icon-arrow-bottom"></i>
                          <select class="select-default" id="child_category" name="product[category_id]">-
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                          </div>
                        </div>`;
      $('#parent-category').append(childSelectHtml);
    }
  // 孫カテゴリーの表示作成
  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='select-wrap' id= 'grandchildren_wrapper'>
                              <i class="icon-arrow-bottom"></i>
                                <select class="select-default" id="grandchild_category" name="product[category_id]">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                            </div>`;
    $('#parent-category').append(grandchildSelectHtml);
  }

  // 親カテゴリー選択時
  $('#parent-category').on('change', '#parent-form', function(){
    var parentValue = document.getElementById("parent-form").value;
    $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
    $('#grandchildren_wrapper').remove();
    $('.size_wrapper').css('display','none');
    $('.brand-form').css('display','none');
    $.ajax({
      url: '/products/category',
      type: 'GET',
      data: { parent_id: parentValue },
      dataType: 'json'
    })
    .done(function(children){ // childrenにサブカテゴリのname, idが入っている
      var insertHTML = '';
      children.forEach(function(child){
        insertHTML += appendOption(child);
      });
      appendChidrenBox(insertHTML);
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  })
  // サブカテゴリー選択時
  $('#parent-category').on('change', '#child_category', function(){
    var parentValue = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
    $('.size_wrapper').css('display','none');
    $('.brand-form').css('display','none');
    $.ajax({
      url: '/products/category',
      type: 'GET',
      data: { parent_id: parentValue },
      dataType: 'json'
    })
    .done(function(grandchildren){
      if (grandchildren.length != 0) {
        var insertHTML = '';
        grandchildren.forEach(function(grandchild){
          insertHTML += appendOption(grandchild);
        });
        appendGrandchidrenBox(insertHTML);
      }
    })
    .fail(function(){
      alert('カテゴリー取得に失敗しました');
    })
  });

  //  サイズ表示
  $('#parent-category').on('change', '#grandchild_category', function(){
    var parentValue = $('#child_category option:selected').data('category');
    if ( parentValue == 19 || parentValue == 31 ) {
      $('#sizes_wrapper, .shoes_size').css('display', 'block');
    }else if( parentValue == 14 || parentValue == 28 ) {
      $("#sizes_wrapper, .tshirts_size").css('display', 'block');
    }else{
      $('.size_wrapper').css('display','none');
    }
    $('.brand-form').css('display','block');
  });
});
