require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )

  end

  scenario "Users can navigate to the product detail page by clicking on a product" do

    visit root_path

    page.all(".product header a")[0].click
    expect(page).to have_css 'article.product-detail'

    save_screenshot

  end

end
