require 'rails_helper'

describe ProductImage do
  describe '#create' do
    it "is valid with a name" do
      category = FactoryBot.create(:category)
      user = FactoryBot.create(:user)
      brand = FactoryBot.create(:brand)
      product = FactoryBot.create(:product, category_id: category.id, user_id: user.id, brand_id: brand.id)
      product_image = FactoryBot.build(:product_image, product_id: product.id)
      expect(product_image).to be_valid
    end

    it "is invalid without a name" do
      product_image = FactoryBot.build(:product_image, name: "")
      product_image.valid?
      expect(product_image.errors[:name]).to include("can't be blank")
    end

  end
end