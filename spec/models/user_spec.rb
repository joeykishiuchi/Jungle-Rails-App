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

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
