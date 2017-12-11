require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should be valid with all four fields set' do
      category = Category.new(name: 'new')      
      product = Product.new(name: 'book', price: 5000, quantity: 5, category: category)
      expect(product).to be_valid
    end
    
    it 'should not be valid without a name' do
      category = Category.new(name: 'new') 
      product = Product.new(price: 5000, quantity: 5, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Name can\'t be blank')
    end

    it 'should not be valid without a price' do
      category = Category.new(name: 'new') 
      product = Product.new(name: 'book', quantity: 5, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Price can\'t be blank')
    end

    it 'should not be valid without a quantity' do
      category = Category.new(name: 'new') 
      product = Product.new(name: 'book', price: 5000, category: category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Quantity can\'t be blank')
    end

    it 'should not be valid without a category' do
      product = Product.new(name: 'book', price: 5000, quantity: 5)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include('Category can\'t be blank')
    end

  end
end
