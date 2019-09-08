require 'rails_helper'

describe OrdersController do
  describe "#new" do
    before do
      @category = FactoryBot.create(:category)
      @user = FactoryBot.create(:user)
      @brand = FactoryBot.create(:brand)
      @product = FactoryBot.create(:product, category_id: @category.id, user_id: @user.id, brand_id: @brand.id)
    end
    it "responds successfully" do
      sign_in @user
      get :new, params: { format: @product.id }
      expect(response).to be_success
    end
    it "returns a 200 response" do
      sign_in @user
      get :new, params: { format: @product.id }
      expect(response).to have_http_status "200"
    end
  end
end