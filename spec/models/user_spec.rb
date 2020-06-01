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
    it "should give error if :name is not given" do
      @user = User.new({
        :name => nil,
        :email => 'john.smith@gmail.com',
        :password => 'password',
        :password_confirmation => 'password'
      })
      @user.save
      expect(@user.errors.full_messages).to eq(["Name can't be blank"])
    end
    it "should give error if :email is not given" do
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
    it "should give error if password or password_confirmation is not given" do
      @user = User.new({
        :name => 'John Smith',
        :email => 'john.smith@gmail.com',
        :password =>nil,
        :password_confirmation => nil
      })
      @user.save
      expect(@user.errors.full_messages).to eq(["Password can't be blank", "Password is too short (minimum is 8 characters)", "Password confirmation can't be blank"])
    end
    it "should not save if password and password_confirmation do not match" do
      @user = User.new({
        :name => 'John Smith',
        :email => 'john.smith@gmail.com',
        :password =>'password',
        :password_confirmation => 'PASSWORD'
      })
      @user.save
      expect(@user.save).to eq(false)
    end
    it "should not save if password is shorter than 8 characters" do
      @user = User.new({
        :name => 'John Smith',
        :email => 'john.smith@gmail.com',
        :password =>'toshort',
        :password_confirmation => 'toshort'
      })
      @user.save
      expect(@user.save).to eq(false)
    end
  end

  describe '.authenticate_with_credentials' do
    it "should allow user to login with proper credentials" do
      @user = User.new({
        :name => 'John Smith',
        :email => 'john.smith@gmail.com',
        :password =>'password',
        :password_confirmation => 'password'
      })
      @user.save
      user = User.authenticate_with_credentials('john.smith@gmail.com', 'password')
      expect(user.name).to eq('John Smith')
    end
    it "should not allow user to login with invalid email" do
      @user = User.new({
        :name => 'John Smith',
        :email => 'john.smith@gmail.com',
        :password =>'password',
        :password_confirmation => 'password'
      })
      @user.save
      user = User.authenticate_with_credentials('jason.smyth@gmail.com', 'password')
      expect(user).to eq(nil)
    end
    it "should not allow user to login with invalid password" do
      @user = User.new({
        :name => 'John Smith',
        :email => 'john.smith@gmail.com',
        :password =>'password',
        :password_confirmation => 'password'
      })
      @user.save
      user = User.authenticate_with_credentials('john.smith@gmail.com', 'wordpass')
      expect(user).to eq(false)
    end
  end

end
