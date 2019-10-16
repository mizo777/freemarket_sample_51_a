categories = [
  # 親カテゴリ
  { id: 1, name: "レディース"},
  { id: 2, name: "メンズ"},
  { id: 3, name: "ベビー・キッズ"},
  { id: 4, name: "インテリア・住まい・小物"},
  { id: 5, name: "本・音楽・ゲーム"},
  { id: 6, name: "おもちゃ・ホビー・グッズ"},
  { id: 7, name: "コスメ・香水・美容"},
  { id: 8, name: "家電・スマホ・カメラ"},
  { id: 9, name: "スポーツ・レジャー"},
  { id: 10, name: "ハンドメイド"},
  { id: 11, name: "チケット"},
  { id: 12, name: "自動車・オートバイ"},
  # 子カテゴリ
  { id: 101, name: "トップス", ancestry: 1 },
  { id: 102, name: "ジャケット/アウター", ancestry: 1 },
  { id: 103, name: "靴", ancestry: 1 },
  { id: 104, name: "帽子", ancestry: 1 },
  { id: 105, name: "バッグ", ancestry: 1 },
  { id: 106, name: "小物", ancestry: 1 },
  { id: 107, name: "トップス", ancestry: 2 },
  { id: 108, name: "ジャケット/アウター", ancestry: 2 },
  { id: 109, name: "パンツ", ancestry: 2 },
  { id: 110, name: "靴", ancestry: 2 },
  { id: 111, name: "バッグ", ancestry: 2 },
  { id: 112, name: "帽子", ancestry: 2 },
  { id: 113, name: "小物", ancestry: 2 },
  { id: 114, name: "キッズ服(男の子用)100cm~", ancestry: 3 },
  { id: 115, name: "キッズ靴", ancestry: 3 },
  { id: 116, name: "子供用ファッション小物", ancestry: 3 },
  { id: 117, name: "ベッド/マットレス", ancestry: 4 },
  { id: 118, name: "おもちゃ", ancestry: 6 },
  { id: 119, name: "漫画", ancestry: 5 },
  { id: 120, name: "メイクアップ", ancestry: 7 },
  { id: 121, name: "ボディケア", ancestry: 7 },
  { id: 122, name: "カメラ", ancestry: 8 },
  { id: 123, name: "ゴルフ", ancestry: 9 },
  { id: 124, name: "ファッション/小物", ancestry: 10 },
  { id: 125, name: "音楽", ancestry: 11 },
  { id: 126, name: "自動車/オートバイ", ancestry: 12 },
  { id: 127, name: "香水", ancestry: 7 },
  { id: 128, name: "スキンケア/基礎化粧品", ancestry: 7 },
  { id: 129, name: "ヘアケア", ancestry: 7 },
  # 孫カテゴリ
  { id: 201, name: "Tシャツ/カットソー(半袖/袖なし)", ancestry: "1/101" },
  { id: 202, name: "その他", ancestry: "1/102" },
  { id: 203, name: "スニーカー", ancestry: "1/103" },
  { id: 204, name: "ローファー/革靴", ancestry: "1/103" },
  { id: 205, name: "ニットキャップ/ビーニー", ancestry: "1/104" },
  { id: 206, name: "ハンドバッグ", ancestry: "1/105" },
  { id: 207, name: "ショルダーバッグ", ancestry: "1/105" },
  { id: 208, name: "ポーチ/バニティ", ancestry: "1/105" },
  { id: 209, name: "長財布", ancestry: "1/106" },
  { id: 210, name: "キーケース", ancestry: "1/106" },
  { id: 211, name: "ベルト", ancestry: "1/106" },
  { id: 212, name: "サングラス/メガネ", ancestry: "1/106" },
  { id: 213, name: "Tシャツ/カットソー(半袖/袖なし)", ancestry: "2/107" },
  { id: 214, name: "シャツ", ancestry: "2/107" },
  { id: 215, name: "パーカー", ancestry: "2/107" },
  { id: 216, name: "ジャージ", ancestry: "2/107" },
  { id: 217, name: "その他", ancestry: "2/108" },
  { id: 218, name: "ワークパンツ/カーゴパンツ", ancestry: "2/109" },
  { id: 219, name: "スニーカー", ancestry: "2/110" },
  { id: 220, name: "ウエストポーチ", ancestry: "2/111" },
  { id: 221, name: "キャップ", ancestry: "2/112" },
  { id: 222, name: "長財布", ancestry: "2/113" },
  { id: 223, name: "ネクタイ", ancestry: "2/113" },
  { id: 224, name: "手袋", ancestry: "2/113" },
  { id: 225, name: "トップス(トレーナー)", ancestry: "3/114" },
  { id: 226, name: "スニーカー", ancestry: "3/115" },
  { id: 228, name: "帽子", ancestry: "3/116" },
  { id: 229, name: "手袋", ancestry: "3/116" },
  { id: 230, name: "バッグ", ancestry: "3/116" },
  { id: 231, name: "アイシャドウ", ancestry: "7/117" },
  { id: 232, name: "口紅", ancestry: "7/117" },
  { id: 233, name: "香水(女性用)", ancestry: "7/118" },
  { id: 234, name: "香水(男性用)", ancestry: "7/118" },
  { id: 235, name: "ボディミスト", ancestry: "7/118" },
  { id: 236, name: "化粧水/ローション", ancestry: "7/119" },
  { id: 237, name: "トリートメント", ancestry: "7/120" },
  { id: 238, name: "ハンドクリーム", ancestry: "7/121" },
  { id: 240, name: "セミダブルベッド", ancestry: "4/117" },
  { id: 242, name: "全巻セット", ancestry: "5/119" },
  { id: 244, name: "ぬいぐるみ", ancestry: "6/118" },
  { id: 246, name: "デジタルカメラ", ancestry: "8/122" },
  { id: 248, name: "クラブ", ancestry: "9/123" },
  { id: 250, name: "財布/(男性用)", ancestry: "10/124" },
  { id: 252, name: "男性アイドル", ancestry: "11/125" },
  { id: 254, name: "自動車本体", ancestry: "12/126" }
]

brands = [
  { id: 1, name: "シャネル", created_at: "2019-08-26 21:42:00", updated_at: "2019-08-26 21:42:30" },
  { id: 2, name: "ナイキ", created_at: "2019-08-26 21:43:45", updated_at: "2019-08-26 21:44:00" },
  { id: 3, name: "ルイ ヴィトン", created_at: "2019-08-26 21:44:45", updated_at: "2019-08-26 21:45:00" },
  { id: 4, name: "シュプリーム", created_at: "2019-08-26 21:45:30", updated_at: "2019-08-26 21:45:45" },
  { id: 5, name: "アディダス", created_at: "2019-08-26 21:46:30", updated_at: "2019-08-26 21:47:00" },
]

users = [
  { id: 40, email: "aaan@i.softbank.jp", password: "aaan0102", password_confirmation: "aaan0102",   first_name: "a", last_name: "b", first_kana_name: "c", last_kana_name: "d", nickname: "みどりん 9／10まで発送できません", profile: "f", payment_way: "g", birthday: "h", confirmation_document: "i" },
  { id: 41, email: "aaao@i.softbank.jp", password: "aaao0102", password_confirmation: "aaao0102",   first_name: "a", last_name: "b", first_kana_name: "c", last_kana_name: "d", nickname: "らら", profile: "f", payment_way: "g", birthday: "h", confirmation_document: "i" },
  { id: 42, email: "aaap@i.softbank.jp", password: "aaap0102", password_confirmation: "aaap0102",   first_name: "a", last_name: "b", first_kana_name: "c", last_kana_name: "d", nickname: "AZUL", profile: "f", payment_way: "g", birthday: "h", confirmation_document: "i" }
]

ActiveRecord::Base.transaction do
  categories.each do |category|
    Category.create!(category)
  end
  brands.each do |brand|
    Brand.create!(brand)
  end
  users.each do |user|
    User.create!(user)
  end
end