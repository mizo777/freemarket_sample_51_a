require 'rails_helper'

describe Brand do
  describe '#create' do
    it "is valid with a name" do
      brand = FactoryBot.build(:brand)
      expect(brand).to be_valid
    end

    it "is invalid without a name" do
      brand = FactoryBot.build(:brand, name: "")
      brand.valid?
      expect(brand.errors[:name]).to include("can't be blank")
    end

    it "is invalid with a duplicate brand name" do
      brand = FactoryBot.create(:brand)
      another_brand = FactoryBot.build(:brand, name: brand.name)
      another_brand.valid?
      expect(another_brand.errors[:name]).to include("has already been taken")
    end
  end
end
