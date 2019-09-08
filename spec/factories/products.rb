FactoryBot.define do
  factory :product do
    id {"1"}
    name {"nakanaka様専用ルイヴィトン モノグラム キーケース 4連"}
    price {2500}
    category_id           {1}
    user_id               {1}
    brand_id              {1}
    size {"M"}
    state {"傷や汚れあり"}
    delivery_burden {0}
    delivery_way {"\tらくらくメルカリ便"}
    delivery_from {"東京都"}
    delivery_time {"2~3日で発送"}
    detail {"新しいのに変えたので出品します。\n中古ですが、まだ使えると思います。"}
    likes_count {1}
    sold {"false"}
    status                { 0 }  
  end
end