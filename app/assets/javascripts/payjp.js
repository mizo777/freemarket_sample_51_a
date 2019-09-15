$(function() {
  $(document).on("click", "#token_submit", function(e) {
    e.preventDefault();
    var form = $("#charge_form");
    Payjp.setPublicKey("pk_test_8da00aba5ee999041f3a784e");
    form.find("input[type=submit]").prop("disabled", true);
    var card = {
      card_number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      expire_month: $("#expire_month").val(),
      expire_year: $("#expire_year").val()
    };
    console.log(card);
    Payjp.createToken(card, function(status, response) {
      if (status == 200) {
        console.log(status);
        $(".card_number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".expire_month").removeAttr("name");
        $(".expire_year").removeAttr("name");
        form.append($('<input type="hidden" name="payjp-token">').val(response.id));
        form.get(0).submit();
        alert("登録が完了しました");
      } else {
        console.log(status);
        alert("カード情報が正しくありません。") 
      }
    });
  });
});