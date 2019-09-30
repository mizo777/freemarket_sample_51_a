$(document).on('turbolinks:load', function() {
  // 画像プレビュー表示
  $(document).on('change', 'input[type="file"]', function(e) {
    // ファイルをプレビュー場所に移動
    $("#preview").append(this)
    var file = e.target.files[0],
        reader = new FileReader(),
        fgureClass = $(this).attr('id'),
        previewHtml = 
                      `<li class="sell-upload-item delete_${fgureClass}">
                        <figure class="sell-upload-figure landscape ${fgureClass}">
                        </figure>
                        <div class="sell-upload-button">
                          <label for=${fgureClass} class="sell-upload-edit">編集</label>
                          <div class="sell-upload-delete" id="delete_${fgureClass}">削除</div>
                        </div>
                      </li>`;
        t = this

    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }
    // ファイルにhtml追加
    if ($("."+ fgureClass).length == 0){
    $(previewHtml).insertBefore(this);
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        // 既存のプレビューを削除
        $("."+ fgureClass + " " + "img").remove();
        // プレビューの追加
        $("."+ fgureClass).append($('<img>').attr({
          src: e.target.result,
          width: "50px",
          class: "preview",
          title: file.name
        }));
        // 画像数によって表示幅の変更
        imageAmount = $("#preview img").length
        if (imageAmount == 10) {
          $(".sell-upload-drop-box").remove();
        } else if (imageAmount <= 4) {
          $(".sell-upload-drop-box").css({
            'width': `calc(100% - (20% * ${imageAmount}))`
          })
        } else if (imageAmount == 5) {
          $(".sell-upload-drop-box").css({
            'float': 'none',
            'display': 'none !important',
            'width': '100%',
          })
        } else if (6 <= imageAmount <= 9) {
          $(".sell-upload-drop-box").css({
            'width': `calc(100% - (20% * (${imageAmount} - 5)))`,
          })
        }
      };
    })(file);
    reader.readAsDataURL(file);
    // inputファイルの追加
    var file_num = $('#preview input[type="file"]').length
    var touchFile = $('.sell-upload-drop-box input').length
    if(touchFile == 0){
    $('.sell-upload-drop-box').append('<input class="file-icon delete_image_' + file_num + '" id="image_' + file_num + '" type="file" name="product[product_images_attributes]['+ file_num +'][image]">');
    $(".sell-upload-drop-box").attr("for",'image_' + file_num + '');
    }
  });
})  

// 削除
$(document).on("click", ".sell-upload-delete", function () {
  // プレビュー画像、fileの削除
  var deleteClass = $(this).attr('id');
  $("."+ deleteClass).remove()
  // 削除後の枠調整
  ImageAmount = $("#preview li").length
  if (ImageAmount == 10) {
    $(".sell-upload-drop-box").remove();
  } else if (ImageAmount <= 4) {
    $(".sell-upload-drop-box").css({
      'width': `calc(100% - (20% * ${ImageAmount}))`
    })
  } else if (ImageAmount == 5) {
    $(".sell-upload-drop-box").css({
      'float': 'none',
      'display': 'none !important',
      'width': '100%',
    })
  } else if (6 <= ImageAmount <= 9) {
    $(".sell-upload-drop-box").css({
      'width': `calc(100% - (20% * (${ImageAmount} - 5)))`,
    })
  }
})