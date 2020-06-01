require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do 
    @category = Category.new({:name => 'test_category'})
  end

  describe 'Validations' do
    it 'saves product with all necessary fields' do
      @product = Product.new({
        :name => 'ball',
        :price => 10,
        :quantity => 10,
        :category => @category
      })
      
      expect(@product.save).to eq(true)
    end
    it 'returns error when :name is not given' do 
      @product = Product.new({
        :name => nil,
        :price => 10,
        :quantity => 10,
        :category => @category
      })
      @product.save
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end
    it 'returns error when :price is not given' do
      @product = Product.new({  
        :name => 'ball',
        :price => nil,
        :quantity => 10,
        :category => @category
      })
      @product.save
      expect(@product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end
    it 'returns error when :quantity is not given' do
      @product = Product.new({  
        :name => 'ball',
        :price => 10,
        :quantity => nil,
        :category => @category
      }) 
      @product.save
      expect(@product.errors.full_messages).to eq(["Quantity can't be blank"])
    end
    it 'returns error when :category is not given' do
      @product = Product.new({  
        :name => 'ball',
        :price => 10,
        :quantity => 10,
        :category => nil
      })
      @product.save
      expect(@product.errors.full_messages).to eq(["Category can't be blank"])
    end
  end
end
