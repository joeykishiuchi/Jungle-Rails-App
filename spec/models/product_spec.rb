require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do 
    @category = Category.new({:name => 'test_category'})
  end

  describe 'Validations' do
    it 'saves product with all necessary fields' do
    end
    it 'returns error when :name is not given' do 
    end
    it 'returns error when :price is not given' do 
    end
    it 'returns error when :quantity is not given' do 
    end
    it 'returns error when :category is not given' do 
    end
  end
end
