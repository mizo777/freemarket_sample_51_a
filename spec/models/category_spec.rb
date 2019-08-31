require 'rails_helper'

describe Category do
  describe '#create' do
    it "is valid with a name" do
      parent = FactoryBot.create(:parent)
      category = FactoryBot.build(:category, parent_id: 0)
      expect(category).to be_valid
    end

    it "is invalid without a name" do
      category = FactoryBot.build(:category, name: "")
      category.valid?
      expect(category.errors[:name]).to include("can't be blank")
    end

    it "is invalid with a duplicate category name" do
      category = FactoryBot.create(:category, parent_id: 0)
      another_category = FactoryBot.build(:category, name: category.name, parent_id: category.parent_id)
      another_category.valid?
      expect(another_category.errors[:name]).to include("has already been taken")
    end
  end
end