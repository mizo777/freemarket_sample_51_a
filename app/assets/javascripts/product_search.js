//リロードしても商品検索フォームの値が消えず残る
window.onload = function() {
  var name = sessionStorage.getItem('name');
  if(name !== null)$('#inputName').val(name);
}
window.onbeforeunload = function() {
  sessionStorage.setItem("name", $('#inputName').val());
}
//商品検索フォームでEnterキーを押すと実行される
function enter(){
  if( window.event.keyCode == 13 ){
    document.form1.submit();
  }
}