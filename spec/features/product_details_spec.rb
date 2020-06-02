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

  scenario "They click on product and see product page" do
    # ACT
    visit root_path

    page.find_link("Details", match: :first).click

    expect(page).to have_css('.products-show')
    # DEBUG / VERIFY
    save_screenshot
  end
end
