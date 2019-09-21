crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_index_path
end

crumb :notification do
  link "お知らせ", notification_mypage_index_path
  parent :mypage
end

crumb :todo do
  link "やることリスト", todo_mypage_index_path
  parent :mypage
end

crumb :like do
  link "いいね！一覧", like_mypage_index_path
  parent :mypage
end

crumb :exhibiting do
  link "出品した商品- 出品中", exhibiting_mypage_index_path
  parent :mypage
end

crumb :exhibit_trading do
  link "出品した商品- 取引中", exhibit_trading_mypage_index_path
  parent :mypage
end

crumb :exhibited do
  link "出品した商品- 売却済み", exhibited_mypage_index_path
  parent :mypage
end

crumb :purchase do
  link "購入した商品- 取引中", purchase_mypage_index_path
  parent :mypage
end

crumb :purchased do
  link "購入した商品- 過去の取引", purchased_mypage_index_path
  parent :mypage
end

crumb :news do
  link "ニュース一覧", news_mypage_index_path
  parent :mypage
end

crumb :review do
  link "評価一覧", review_mypage_index_path
  parent :mypage
end

crumb :contact do
  link "お問い合わせ", contact_mypage_index_path
  parent :mypage
end

crumb :sales do
  link "売上・振込申請", sales_mypage_index_path
  parent :mypage
end

crumb :point do
  link "ポイント", point_mypage_index_path
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_mypage_index_path
  parent :mypage
end

crumb :delivery_address do
  link "発送元・お届け先住所変更", delivery_address_mypage_index_path
  parent :mypage
end

crumb :card_new do
  link "支払い方法", cards_new_path
  parent :mypage
end

crumb :card_show do
  link "支払い方法", cards_show_path
  parent :mypage
end

crumb :identification do
  link "本人情報", identification_mypage_index_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_mypage_index_path
  parent :mypage
end