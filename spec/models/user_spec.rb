require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a email, password, password_confirmation" do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a email" do
      user = FactoryBot.build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password" do
      user = FactoryBot.build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without password_confirmation although with a password" do
      user = FactoryBot.build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is invalid with a duplicate email address" do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    it "is valid with a password that has more than 6 characters" do
      user = FactoryBot.build(:user, password: "bbbbbb", password_confirmation: "bbbbbb")
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 5 characters" do
      user = FactoryBot.build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short")
    end
  end
end

# RSpec.describe User, type: :model do
#   it "is valid with email, password" do
#     user = User.new(id: 1, email: "bbb@i.softbaank.jp", password: "jjjaaaaa")
#     expect(user).to be_valid
#   end
# end

# RSpec.describe Brand, type: :model do
#   it "is valid with name" do
#     brand = Brand.new(id: 3, name: "ルイ ヴィトン")
#     expect(brand).to be_valid
#   end
# end

# RSpec.describe Category, type: :model do
#   it "is valid with name, parent_id" do
#     category = Category.new(id: 1, name: "レディース", parent_id: 0)
#     expect(category).to be_valid
#   end
# end

# RSpec.describe Product, type: :model do
#   it "is valid with name, price, category_id, user_id, brand_id, size, state, delivery_burden, delivery_way, delivery_from, detail, likes_count, sold" do
#     product = Product.new(id: 1, name: "nakanaka様専用ルイヴィトン モノグラム キーケース 4連", price: 2500, category_id: 1, user_id: 1, brand_id: 3, size: "", state: "傷や汚れあり", delivery_burden: 0, delivery_way: "らくらくメルカリ便", delivery_from: "東京都", delivery_time: "2~3日で発送", detail: "新しいのに変えたので出品します。\n中古ですが、まだ使えると思います。", likes_count: 1, sold: false)
#     expect(product).to be_valid
#   end
# end

# RSpec.describe ProductImage, type: :model do
#   it "is valid with name, product_id" do
#     product_image = ProductImage.new(name: "m77835579238_1.jpg", product_id: 1)
#     expect(product_image).to be_valid
#   end
# end


