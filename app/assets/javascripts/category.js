$(document).on('turbolinks:load', function() {
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;      
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='select-wrap' id='children_wrapper'>
                          <i class="icon-arrow-bottom"></i>      
                          <select class="select-default" id="child_category" name="category_id">-
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
                                <select class="select-default" id="grandchild_category" name="category_id">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                            </div>`;
    $('#parent-category').append(grandchildSelectHtml);
  }

  // サイズ・ブランド表示
  function appendSizeCategory(insertHTML){
    var sizeSelectHtml = '';
    sizeSelectHtml = `<div class="form-group " id= "size_wrapper">
                              <label>
                              サイズ
                              <span class="form-require">
                              必須
                              </span>
                              </label>
                              <div>
                                <div class="select-wrap size_wrapper">
                                  <i class="icon-arrow-bottom"></i>
                                  <select class="select-default"ｒ name="size_id">
                                    <option value="---" data-category="---">---</option>                               
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>
                            </div>
                            <div class="form-group brand_wrapper" id="brand_wrapper">
                              <label>
                              ブランド
                              <span class="form-arbitrary">
                              任意
                              </span>
                              </label>
                              <div>
                                <div class="select-wrap">
                                  <i class="icon-arrow-bottom"></i>
                                  <select class="select-default" name="product[brand_id]" id="product_brand_id"><option value="">---</option>
                                    <option value="1">ディーゼル</option>
                                    <option value="2">ユニクロ</option></select>
                                </div>
                              </div>
                            </div>`;


    $('#parent-category').append(sizeSelectHtml);
  }

  
  
  // 親カテゴリー選択時
  $("#parent-form").on("change",function(){
    var parentValue = document.getElementById("parent-form").value;
      $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
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
  })
  // サブカテゴリー選択時
  $('#parent-category').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
      $.ajax({
        url: '/products/child_category',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
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

  //  サイズ表示・ブランド表示
  $('#parent-category').on('change', '#grandchild_category', function(){
    var grandChildId = $('#grandchild_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    $.ajax({
        url: '/products/size_category',
        type: 'GET',
        data: { grandchild_id: grandChildId },
        dataType: 'json'
      })
      .done(function(sizeCategory){
          // $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除するする
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          sizeCategory.forEach(function(size){
            insertHTML += appendOption(size);
          });
          appendSizeCategory(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
  });
});
