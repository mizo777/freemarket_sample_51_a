FactoryBot.define do
  factory :product do
    name {"シューズ"}
    price {2000}
    size {"24cm"}
    state {"新品、未使用"}
    delivery_burden {0}
    delivery_way {"らくらくメルカリ便"}
    delivery_from {"東京都"}
    delivery_time {"2~3日で発送"}
    detail {"新品です。"}
    likes_count {1}
    sold {"false"}
  end
end