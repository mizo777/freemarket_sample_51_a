// 画像プレビュー表示
function previewFiles() {
  var preview = document.querySelector('#preview');
  var files   = document.querySelector('input[type=file]').files;
  // 画像プレビュー
  function readAndPreview(file) {
    if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
      var reader = new FileReader();
      reader.addEventListener("load", function () {
        // 重複削除
        $("#preview figure").unwrap();
        $("#preview img").unwrap();
        $(".sell-upload-button").remove();        
        var li = $('<li class="sell-upload-item"><figure class="sell-upload-figure landscape"></figure></li>');
        var image = new Image();
        image.title = file.name;
        image.src = this.result;
        preview.appendChild( image );
        // 要素追加
        $("#preview img").wrap(li);
        var img = `<div class="sell-upload-button">
                    <div class="sell-upload-edit">編集</div>
                    <div class="sell-upload-delete">削除</div>
                  </div> </li>`;
        $('.sell-upload-item').append(img);
        // 画像数確認
        imageAmount = $("#preview img").length
        // 画像数によって表示幅の変更
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
      }, false);
      reader.readAsDataURL(file);
    }    
  }
  if (files) {
    [].forEach.call(files, readAndPreview);
  }
}
// プレビュー表示したinputタグを最後尾に移動(同じものがクリックされないよう)
$(document).on('turbolinks:load', function() {
  $(document).on("change", ".file-icon", function() {
    $(this).appendTo(".sell-upload-drop-box");
  })
})  
// 削除
$(document).on("click", ".sell-upload-delete", function () {
  // 何番目のプレビュー 画像か
  var previewIndex = $('.sell-upload-delete').index(this);
  // プレビュー 画像の総数
  ImageAmount = $("#preview li").length
  // プレビュー 画像と同じinput要素の順番
  var inputIndex = previewIndex - ImageAmount;
  // プレビュー 画像の削除
  $(this).parent().parent().remove();
  // input要素の削除・補充
  $(".sell-upload-drop-box input").eq(inputIndex).remove();
  var inputField = $('<input class="file-icon" id="file" onchange="previewFiles()" name="product[product_images_attributes][0][image][]" type="file">')
  $(".sell-upload-drop-box").prepend(inputField)
  // 削除後のinput枠調整
  AfterImageAmount = ImageAmount -1
  if (AfterImageAmount == 10) {
    $(".sell-upload-drop-box").remove();
  } else if (AfterImageAmount <= 4) {
    $(".sell-upload-drop-box").css({
      'width': `calc(100% - (20% * ${AfterImageAmount}))`
    })
  } else if (AfterImageAmount == 5) {
    $(".sell-upload-drop-box").css({
      'float': 'none',
      'display': 'none !important',
      'width': '100%',
    })
  } else if (6 <= AfterImageAmount <= 9) {
    $(".sell-upload-drop-box").css({
      'width': `calc(100% - (20% * (${AfterImageAmount} - 5)))`,
    })
  }
})
$(document).on("click", ".sell-upload-edit", function () {
  // 何番目のプレビュー 画像か
  var previewIndex = $('.sell-upload-edit').index(this);
  // プレビュー 画像の総数
  ImageAmount = $("#preview li").length
  // プレビュー 画像と同じinput要素の順番
  var inputIndex = previewIndex - ImageAmount;
  console.log(inputIndex);
  // input要素の削除・補充
  $(".sell-upload-drop-box input").eq(inputIndex).click();
})