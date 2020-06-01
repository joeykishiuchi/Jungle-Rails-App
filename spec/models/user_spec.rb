require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "saves user with all necessary fields" do
      @user = User.new({
        :name => 'John Smith',
        :email => 'john.smith@gmail.com',
        :password => 'password',
        :password_confirmation => 'password'
      })
      expect(@user.save).to eq(true)
    end
    it "saves user with all necessary fields" do
      @user = User.new({
        :name => nil,
        :email => 'john.smith@gmail.com',
        :password => 'password',
        :password_confirmation => 'password'
      })
      @user.save
      expect(@user.errors.full_messages).to eq(["Name can't be blank"])
    end
    it "saves user with all necessary fields" do
      @user = User.new({
        :name => 'John Smith',
        :email => nil,
        :password => 'password',
        :password_confirmation => 'password'
      })
      @user.save
      expect(@user.errors.full_messages).to eq(["Email can't be blank"])
    end
    it "should not save to db if emails do not match even with different casing" do
      @user = User.new({
        :name => 'John Smith',
        :email => 'john.smith@gmail.com',
        :password => 'password',
        :password_confirmation => 'password'
      })
      @user.save
      @user = User.new({
        :name => 'John Smith',
        :email => 'JOHN.SMITH@gmail.com',
        :password => 'password',
        :password_confirmation => 'password'
      })
      expect(@user.save).to eq(false)
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
