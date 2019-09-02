$(document).on('turbolinks:load', function() {
  $("#delivery_burden").on("change",function(){
    $('#burden').remove();
    // 送料込み選択時
    var burdenValue = document.getElementById("delivery_burden").value;
    if (burdenValue == "送料込み(出品者負担)") {
      var seller = `<div class="form-group" id="burden">
                      <label>
                        配送の方法
                        <span class="form-require">必須</span>
                      </label>
                      <div class="select-wrap" id="derivery_way">
                        <i class="icon-arrow-bottom"></i>
                        <select class="select-default" name="product[delivery_way]" id="product_delivery_way">
                          <option value="">---</option>
                          <option>未定</option>
                          <option>らくらくメルカリ便</option>
                          <option>ゆうメール</option>
                          <option>レターパック</option>
                          <option>普通郵便(定形、定形外)</option>
                          <option>クロネコヤマト</option>
                          <option>ゆうパック</option>
                          <option>クリックポスト</option>
                          <option>ゆうパケット</option>
                        </select>
                      </div>
                   </div>`
    // 着払い選択時
     $('#burden-head').append(seller);  
    } else if(burdenValue == "着払い(購入者負担)"){
      var buyer = `<div class="form-group" id="burden">
                    <label>
                      配送の方法
                      <span class="form-require">必須</span>
                    </label>
                    <div class="select-wrap" id="derivery_way">
                      <i class="icon-arrow-bottom"></i>
                      <select class="select-default" name="product[delivery_way]" id="product_delivery_way">
                        <option value="">---</option>
                        <option>未定</option>
                        <option>クロネコヤマト</option>
                        <option>ゆうパック</option>
                        <option>ゆうメール</option>
                      </select>
                    </div>
                   </div>`
     $('#burden-head').append(buyer);
    }else{
      $('#burden').remove();
    }
  })
});
