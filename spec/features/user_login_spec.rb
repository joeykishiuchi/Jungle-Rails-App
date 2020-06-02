require 'rails_helper'

RSpec.feature "Visitor logs in", type: :feature, js: true do
  before(:each) do
    @user = User.create!(
      first_name: 'John',
      last_name: 'Smith',
      email: 'john.smith@gmail.com',
      password: 'password',
      password_confirmation: 'password'
      )
  end

  scenario "Visitor is directed to the hompage when successfully logged in" do 
    visit '/login'

    fill_in 'user_email', with: 'john.smith@gmail.com'
    fill_in 'user_password', with: 'password'
    find("input[value='Submit']").click

    expect(page).to have_text('Logout')
    
    save_screenshot
  end
end
