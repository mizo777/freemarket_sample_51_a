FactoryBot.define do
  factory :user do
    id {2}
    email {"aaaa@i.softbank.jp"}
    password {"aaaa0102"}
    password_confirmation {"aaaa0102"}
    first_name {"a"}
    last_name {"b"}
    first_kana_name {"c"}
    last_kana_name {"d"}
    nickname {"okunao"}
    profile {"f"}
    payment_way {"g"}
    birthday {"h"}
    confirmation_document {"i"}
  end
end
