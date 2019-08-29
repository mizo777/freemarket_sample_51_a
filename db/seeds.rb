# ユーザー
User.create(email:"meru@meru", password:"meru1234", first_name:"meru", last_name:"cari", first_kana_name:"メル", last_kana_name:"カリ", nickname:"メルカリ", payment_way:"1122344555")
# カテゴリー
mens, hoby = Category.create([{name: "メンズ"}, {name: "本・音楽・ゲーム"}])
tops, shoes = mens.children.create([{name: "トップス"}, {name: "靴"}])
tops.children.create([{name: "Tシャツ"}, {name: "パーカー"}])
shoes.children.create([{name: "ブーツ"}, {name: "スニーカー"}])
book, geme = hoby.children.create([{name: "本"}, {name: "ゲーム"}])
# ブランド
Brand.create([{name:"ディーゼル"}, {name:"ユニクロ"}])
# 画像
ProductImage.create(name:"111")
# 商品
Product.create(name:"シャツ", brand_id:1, category_id:5, user_id:1, price:3000, size:"M", state:"新品", delivery_burden:"出品者", delivery_way:"メルカリ便", delivery_from:"大阪", delivery_time:"２日", product_image_id:1)
