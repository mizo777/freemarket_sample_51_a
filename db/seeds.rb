# ユーザー
User.create(email:"meru@meru", password:"meru1234", first_name:"meru", last_name:"cari", first_kana_name:"メル", last_kana_name:"カリ", nickname:"メルカリ", payment_way:"1122344555")
# カテゴリー
Category.create([{name: "レディース"}, {name: "メンズ"}, {name: "ベビー・キッズ"}, {name: "インテリア・住まい・小物"}, {name: "本・音楽・ゲーム"}, {name: "おもちゃ・ホビー・グッズ"}, {name: "コスメ・香水・美容"}, {name: "家電・スマホ・カメラ"}, {name: "スポーツ・レジャー"}, {name: "ハンドメイド"}, {name: "チケット"}, {name: "自動車・オートバイ"}, {name: "その他"}])
Category.find_by(id:2).children.create([{name: "トップス"}, {name: "ジャケット/アウター"}, {name: "パンツ"}, {name: "靴"}, {name: "バッグ"}, {name: "スーツ"}, {name: "帽子"}])
Category.find_by(id:14).children.create([{name: "Tシャツ"}, {name: "シャツ"}, {name: "パーカー"}, {name: "ポロシャツ"}, {name: "タンクトップ"}, {name: "カーディガン"}, {name: "ジャージ"}])
Category.find_by(id:1).children.create([{name: "トップス"}, {name: "ジャケット/アウター"}, {name: "パンツ"}, {name: "靴"}, {name: "バッグ"}, {name: "スーツ"}, {name: "帽子"}])
Category.find_by(id:31).children.create([{name: "スニーカー"}, {name: "サンダル"}, {name: "ブーツ"}, {name: "モカシン"}, {name: "ドレス"}, {name: "長靴"}, {name: "デッキシューズ"}])
Category.find_by(id:35).children.create([{name: "20cm以下"}, {name: "20.5cm"}, {name: "21cm"}, {name: "21.5cm"}, {name: "22cm"}, {name: "22.5cm"}, {name: "23cm"}])
# ブランド
Brand.create([{name:"---"}, {name:"ユニクロ"}])
# 画像
ProductImage.create(image:"done.png")
# 商品
Product.create(name:"シャツ", brand_id:1, category_id:5, user_id:1, price:3000, size:"M", state:"新品", delivery_burden:"出品者", delivery_way:"メルカリ便", delivery_from:"大阪", delivery_time:"２日")
