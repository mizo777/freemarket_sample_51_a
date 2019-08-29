# カテゴリー
mens, hoby = Category.create([{name: "メンズ"}, {name: "本・音楽・ゲーム"}])

tops, shoes = mens.children.create([{name: "トップス"}, {name: "靴"}])
tops.children.create([{name: "Tシャツ"}, {name: "パーカー"}])
shoes.children.create([{name: "ブーツ"}, {name: "スニーカー"}])

book, geme = hoby.children.create([{name: "本"}, {name: "ゲーム"}])