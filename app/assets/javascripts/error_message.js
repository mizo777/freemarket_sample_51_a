// エラーメッセージ
$(document).on("click", '.sell-form input[type="submit"]', function () {
  $('.error-message').remove(); 
  // 画像
  if ($("#preview li").length == 0){
    $('.sell-upload-drop-box').parent().append(`<p class="error-message">画像がありません</p>`);}
  // 商品情報
  if ($('input[type="text"], textarea').val() == ""){
    $('input[type="text"]').parent().append(`<p class="error-message">入力してください</p>`);}
  if ($('textarea').val() == ""){
    $('textarea').parent().append(`<p class="error-message">入力してください</p>`);}
  // カテゴリー
  if ($('#parent-form').val() == ""){
    $('#parent-form').parent().append(`<p class="error-message">選択してください</p>`);} 
  if ($('#child_category').val() == "---"){
    $('#child_category').parent().append(`<p class="error-message">選択してください</p>`);} 
  if ($('#grandchild_category').val() == "---"){
    $('#grandchild_category').parent().append(`<p class="error-message">選択してください</p>`);} 
  if ($('[name="product[size]"]').val() == "---"){
    $('[name="product[size]"]').parent().append(`<p class="error-message">選択してください</p>`);} 
  // 商品の状態
  if ($('#product_state').val() == "---"){
    $('#product_state').parent().append(`<p class="error-message">選択してください</p>`);}
  // 配送料の負担、方法
  if ($('#delivery_burden').val() == "---"){
    $('#delivery_burden').parent().append(`<p class="error-message">選択してください</p>`);}
  if ($('#product_delivery_way').val() == ""){
    $('#product_delivery_way').parent().append(`<p class="error-message">選択してください</p>`);}
  // 発送元の地域
  if ($('#product_delivery_from').val() == ""){
    $('#product_delivery_from').parent().append(`<p class="error-message">選択してください</p>`);}
  // 発送元までの日数
  if ($('#product_delivery_time').val() == "---"){
    $('#product_delivery_time').parent().append(`<p class="error-message">選択してください</p>`);}
  // 価格
  if ($('#price-form').val() == ""){
    $('#price-form').parent().append(`<p class="error-message">入力してください</p>`);}
})