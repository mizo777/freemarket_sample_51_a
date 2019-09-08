FactoryBot.define do
  factory :product do
    name                  {"テスト商品"}
    price                 {5000}
    category_id           {1}
    user_id               {"1"}
    brand_id              {1}
    size                  {"M"}
    state                 {"新品"}
    delivery_burden       {"出品者"}
    delivery_way          {"メルカリ便"}
    delivery_from         {"大阪"}
    delivery_time         {"２日"}
    detail                {"テストです"}
    likes_count           {""}
    sold                  {""}
    status                { 0 }  
  end
end