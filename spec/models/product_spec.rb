require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it "should save a valid product" do
      @category = Category.create(name: "Sorceries")
      product = Product.new(
        name: "Great Soul Arrow",
        price: 3000,
        quantity: 3,
        category_id: @category.id
      )
      expect(product).to (be_valid)
    end

    it "should validate name" do
      @category = Category.create(name: "Sorceries")
      product = Product.new(
        name: nil,
        price: 1,
        quantity: 3,
        category_id: @category.id
      )
      expect(product).to_not (be_valid)
    end

    it "should validate price" do
      @category = Category.create(name: "Sorceries")
      product = Product.new(
        name: "Homing Crystal Soulmass",
        price: nil,
        quantity: 1,
        category_id: @category.id
      )
      expect(product).to_not (be_valid)
    end

    it "should validate quantity" do
      @category = Category.create(name: "Sorceries")
      product = Product.new(
        name: "Pestilent Mist",
        price: 1000,
        quantity: nil,
        category_id: @category.id
      )
      expect(product).to_not (be_valid)
    end

    it "should validate category" do
      product = Product.new(
        name: "Spook",
        price: 2000,
        quantity: 3,
        category_id: nil
      )
      expect(product).to_not (be_valid)
    end

  end
end