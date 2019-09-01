require 'rails_helper'

describe ProductImage do
  describe '#create' do

    it "is invalid without a name" do
      product_image = FactoryBot.build(:product_image, name: "")
      product_image.valid?
      expect(product_image.errors[:name]).to include("can't be blank")
    end

  end
end