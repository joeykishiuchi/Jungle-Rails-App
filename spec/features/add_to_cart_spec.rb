require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product and the cart increases by 1" do
    # ACT
    visit root_path

    page.find_button("Add", match: :first).click
    
    expect(page).to have_css('article.product')
      
    cart = find_link("My Cart")

    expect(cart).to have_text('1')
  end
end

