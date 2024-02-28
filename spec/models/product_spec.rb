 require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully with all four fields set' do
      category = Category.create(name: 'Electronics')
      product = Product.new(
        name: 'Product Name',
        price: 19.99,
        quantity: 10,
        category: category
      )
      expect(product.save).to be true
    end

    it 'should validate presence of name' do
      category = Category.create(name: 'Clothing')
      product = Product.new(
        price: 14.99,
        quantity: 5,
        category: category
      )
      product.save
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should validate presence of price' do
      category = Category.create(name: 'Books')
      product = Product.new(
        name: 'Book Title',
        quantity: 3,
        category: category
      )
      product.save
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should validate presence of quantity' do
      category = Category.create(name: 'Furniture')
      product = Product.new(
        name: 'Chair',
        price: 49.99,
        category: category
      )
      product.save
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should validate presence of category' do
      product = Product.new(
        name: 'Product Name',
        price: 29.99,
        quantity: 8
      )
      product.save
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
#spec/models/product_spec.rb