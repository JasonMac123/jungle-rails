require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'form works when all four fieldsets are filled out' do
      @category = Category.create(name: 'Fruits')
      @product = Product.create(name: "AppleHoney", description: "A magical plant", category_id: @category.id, quantity: 3, image: "plante_1.jpg", price: 5999)
      expect(@product.save).to eq(true)
    end

    it 'form does not work when name is not provided' do
      @category = Category.create(name: 'Fruits')
      @product = Product.create(description: "A magical plant", category_id: @category.id, quantity: 3, image: "plante_1.jpg", price: 5999)
      expect(@product.save).to eq(false)
    end

    it 'form does not work when price is not provided' do
      @category = Category.create(name: 'Fruits')
      @product = Product.create(name: "AppleHoney", description: "A magical plant", category_id: @category.id, quantity: 3, image: "plante_1.jpg")
      expect(@product.save).to eq(false)
    end

    it 'form does not work when quantity is not provided' do
      @category = Category.create(name: 'Fruits')
      @product = Product.create(name: "AppleHoney", description: "A magical plant", category_id: @category.id, image: "plante_1.jpg", price: 5999)
      expect(@product.save).to eq(false)
    end

    it 'form does not work when category is not provided' do
      @product = Product.create(name: "AppleHoney", description: "A magical plant", quantity: 3, image: "plante_1.jpg", price: 5999)
      expect(@product.save).to eq(false)
    end
  end
end
