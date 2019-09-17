$(document).on('turbolinks:load', function() {
  // 同じinputがクリックされないように
  $(document).on("click", ".edit-box", function () {
    var imgCount = $(".sell-upload-items li").length
    $(".edit-box input[type=file]").eq(imgCount)[0].click();
  })

  // 画像プレビュー表示
  $('form').on('change', '.edit-box input[type="file"]', function(e) {
    var file = e.target.files[0],
        reader = new FileReader(),
        $preview = $("#preview");
        t = this;
        // 既存のプレビューを削除用
        editIndex = (11 - $(this).index());
        editPreviewIndex = $("#preview img").length - editIndex
    // 画像ファイル以外の場合は何もしない
    if(file.type.indexOf("image") < 0){
      return false;
    }
    // ファイル読み込みが完了した際のイベント登録
    reader.onload = (function(file) {
      return function(e) {
        // 重複削除        
        $("#preview figure").unwrap();
        $("#preview img").unwrap();
        $(".sell-upload-button").remove();
        $preview.append($('<img>').attr({
          src: e.target.result,
          class: "preview",
          title: file.name
      }));
        // 既存のプレビューを削除
        // if (0 <= editPreviewIndex){
        //   $(".preview").eq(editPreviewIndex).remove();
        // }
        var li = $('<li class="sell-upload-item"><figure class="sell-upload-figure landscape"></figure></li>');
        // 要素追加
        $("#preview img").wrap(li);
        var img = `<div class="sell-upload-button">
                    <div class="sell-upload-edit">編集</div>
                    <div class="edit-delete">削除</div>
                  </div> </li>`;
        $('.sell-upload-item').append(img);
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
  })    
  // 登録済み画像削除
  $(document).on("click", ".edit-delete", function () {
    var previewIndex = $('.edit-delete').index(this);
    var deleteImg = $(this).parent().parent().find("img")[0]
    var deleteSrc = $(deleteImg).attr("src")
    var ary = (deleteSrc.split('/'));
    var deleteImage=  ary[ary.length - 2];
    $(".sell-upload-item").eq(previewIndex).remove();
    $('.sell-upload-drop-box input[type="file"]').eq(previewIndex)[0].remove();
    $('.sell-upload-drop-box input[type="hidden"]').eq(previewIndex)[0].remove();
    var inputField = $('<input class="file-icon" id="file" onchange="previewFiles()" name="product[product_images_attributes][0][image][]" type="file">')
    $(".sell-upload-drop-box").append(inputField)
    // // 削除後のinput枠調整
    // AfterImageAmount = ImageAmount -1
    // if (AfterImageAmount == 10) {
    //   $(".sell-upload-drop-box").remove();
    // } else if (AfterImageAmount <= 4) {
    //   $(".sell-upload-drop-box").css({
    //     'width': `calc(100% - (20% * ${AfterImageAmount}))`
    //   })
    // } else if (AfterImageAmount == 5) {
    //   $(".sell-upload-drop-box").css({
    //     'float': 'none',
    //     'display': 'none !important',
    //     'width': '100%',
    //   })
    // } else if (6 <= AfterImageAmount <= 9) {
    //   $(".sell-upload-drop-box").css({
    //     'width': `calc(100% - (20% * (${AfterImageAmount} - 5)))`,
    //   })
    // }    
    $.ajax({
      url: '/product_images/' + deleteImage,
      type: 'DELETE',
      data: { delete_image: deleteImage },
      dataType: 'json'
    }).done(function () {
    });
  })
})
