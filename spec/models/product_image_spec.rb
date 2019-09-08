require 'rails_helper'

describe ProductImage do
  describe '#create' do
    it "is invalid without a image" do
      product_image = build(:product_image, image: nil)
      product_image.valid?
      expect(product_image.errors[:image]).to include("can't be blank")
    end
  end
end