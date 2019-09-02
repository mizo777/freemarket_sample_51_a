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
                    <a href="#" class="sell-upload-edit">編集</a>
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
  // $(document).on("change", "#preview", function() {
  //   $(this).appendTo(".sell-dropbox-container");
  //   new_image_files.push(file)
  //   // プレビュー画像と編集・削除ボタンの追加
  //   reader.onload = function(e) {
  //     var src = e.target.result;
  //     var img = `<li id="sell-upload-item" data-image= "${new_image_imageAmount}">
  //                 <figure>
  //                   <img src="${src}">
  //                 </figure>
  //                 <div class="sell-upload-button">
  //                   <a href="#" class="sell-upload-edit">編集</a>
  //                   <div class="sell-upload-delete">削除</div>
  //                 </div>
  //                </li>`;
  //     $('#preview').append(img);
  //   };
  //   reader.readAsDataURL(file);
  //   var data = $("#sell-upload-item").val();   
  //   console.log(data); 

  // });

  // // 削除
  // $(document).on("click", ".sell-upload-delete", function () {
  //   // 削除ボタンを押した画像を取得
  //   // var target_image = $(this).parent().parent();
  //   $(this).parent().parent().remove();
  //   // 削除画像のdata-image番号を取得
  //   // var target_image_num = target_image.data('image');
  //   // console.log(target_image_num);
  //   // 対象の画像をビュー上で削除
  //   // target_image.remove();
  // })