require 'rails_helper'

describe Product do
  describe '#create' do
    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a price" do
      product = build(:product, price: nil)
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a category_id" do
      product = build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      product = build(:product, user_id: nil)
      product.valid?
      expect(product.errors[:user_id]).to include("can't be blank")
    end

    it "is invalid without a size" do
      product = build(:product, size: nil)
      product.valid?
      expect(product.errors[:size]).to include("can't be blank")
    end

    it "is invalid without a state" do
      product = build(:product, state: nil)
      product.valid?
      expect(product.errors[:state]).to include("can't be blank")
    end

    it "is invalid without a delivery_burden" do
      product = build(:product, delivery_burden: nil)
      product.valid?
      expect(product.errors[:delivery_burden]).to include("can't be blank")
    end

    it "is invalid without a delivery_way" do
      product = build(:product, delivery_way: nil)
      product.valid?
      expect(product.errors[:delivery_way]).to include("can't be blank")
    end

    it "is invalid without a delivery_from" do
      product = build(:product, delivery_from: nil)
      product.valid?
      expect(product.errors[:delivery_from]).to include("can't be blank")
    end

    it "is invalid without a delivery_time" do
      product = build(:product, delivery_time: nil)
      product.valid?
      expect(product.errors[:delivery_time]).to include("can't be blank")
    end
  end
end