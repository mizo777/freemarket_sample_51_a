require 'rails_helper'

describe Product do
  describe '#create' do
    it "is valid with a name, a price, a category_id, a user_id, a brand_id, a size, a state, 
        a delivery_burden, a delivery_way a delivery_from, a delivery_time, a detail, a likes_count, a sold" do
      category = FactoryBot.create(:category)
      user = FactoryBot.create(:user)
      brand = FactoryBot.create(:brand)
      product = FactoryBot.build(:product, category_id: category.id, user_id: user.id, brand_id: brand.id)
      expect(product).to be_valid
    end

    it "is invalid without a name" do
      product = FactoryBot.build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a price" do
      product = FactoryBot.build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a state" do
      product = FactoryBot.build(:product, state: "")
      product.valid?
      expect(product.errors[:state]).to include("can't be blank")
    end

    it "is invalid without a delivery_burden" do
      product = FactoryBot.build(:product, delivery_burden: "")
      product.valid?
      expect(product.errors[:delivery_burden]).to include("can't be blank")
    end

    it "is invalid without a delivery_way" do
      product = FactoryBot.build(:product, delivery_way: "")
      product.valid?
      expect(product.errors[:delivery_way]).to include("can't be blank")
    end

    it "is invalid without a delivery_from" do
      product = FactoryBot.build(:product, delivery_from: "")
      product.valid?
      expect(product.errors[:delivery_from]).to include("can't be blank")
    end

    it "is invalid without a delivery_time" do
      product = FactoryBot.build(:product, delivery_time: "")
      product.valid?
      expect(product.errors[:delivery_time]).to include("can't be blank")
    end
  end
end