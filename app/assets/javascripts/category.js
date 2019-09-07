$(document).on('turbolinks:load', function() {
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;      
      return html;
    }
    function appendSizeOption(size){
      var html = `<option value="${size.name}" data-category="${size.id}">${size.name}</option>`;      
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
  $("#parent-form").on("change",function(){
      var parentValue = document.getElementById("parent-form").value;
      $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
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
          $('.brand-form').css('display','none');
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
    var grandChildId = document.getElementById("grandchild_category").value;
    $('#size_wrapper').remove();
    if (35 <= grandChildId && 41 >= grandChildId) {
      var shoesHtml = '';
      shoesHtml =
      `<div class="form-group " id= "size_wrapper">
        <label>
        サイズ
        <span class="form-require">
        必須
        </span>
        </label>
        <div>
          <div class="select-wrap size_wrapper">
            <i class="icon-arrow-bottom"></i>
            <select class="select-default" name="product[size]">
              <option value="---">---</option>
              <option value="20cm以下">20cm以下</option>
              <option value="20.5cm<">20.5cm</option>
              <option value="21cm">21cm</option>
              <option value="21.5cm">21.5cm</option>
              <option value="22cm">22cm</option>
              <option value="22.5cm">22.5cm</option>
              <option value="23cm">23cm</option>
              <option value="23.5cm">23.5cm</option>
              <option value="24cm">24cm</option>
              <option value="24.5cm">24.5cm</option>
              <option value="25cm">25cm</option>
              <option value="25.5cm">25.5cm</option>
              <option value="26cm">26cm</option>
              <option value="26.5cm">26.5cm</option>
              <option value="27cm">27cm</option>
              <option value="27.5cm以上">27.5cm以上</option>
            </select>
          </div>
        </div>
      </div>`      
      $('#parent-category').append(shoesHtml);
    }else if(21 <= grandChildId && 27 >= grandChildId) {
      var tshirtsHtml = '';
      tshirtsHtml =
      `<div class="form-group " id= "size_wrapper">
        <label>
        サイズ
        <span class="form-require">
        必須
        </span>
        </label>
        <div>
          <div class="select-wrap size_wrapper">
            <i class="icon-arrow-bottom"></i>
            <select class="select-default" name="product[size]">
              <option value="---">---</option>
              <option value="XXS以下">XXS以下</option>
              <option value="XS(SS)">XS(SS)</option>
              <option value="S">S</option>
              <option value="M">M</option>
              <option value="L">L</option>
              <option value="XL(LL)">XL(LL)</option>
              <option value="2XL(3L)">2XL(3L)</option>
              <option value="3XL(4L)">3XL(4L)</option>
              <option value="4XL(5L)以上">4XL(5L)以上</option>
              <option value="FREE SIZE">FREE SIZE</option>
            </select>
        </div>
      </div>`      
      $('#parent-category').append(tshirtsHtml);
    }else{
      $('#size_wrapper').remove();
    }
    $('.brand-form').css('display','block');
  });
});
