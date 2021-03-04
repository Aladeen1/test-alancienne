require "application_system_test_case"

# System test using Capybara to test the application user experience and interaction as if a real user was using it 

class ProductsTest < ApplicationSystemTestCase
  test "Visit the product creation page" do
    visit new_product_path
  
    assert_selector "h1", text: "Create Products"
  end

  test "Create a new product" do
  	visit new_product_path

  	fill_in "product_name", with: "Concombre"
  	fill_in "product_price_ht", with: "4.00"
  	select '5.5%', from: 'product_tva'
  	fill_in "product_stock_available", with: "40"
  	fill_in "product_stock_available", with: "10"

  	click_on 'Ajouter'

  	assert_equal page.current_path, products_path
  end

  test "Make sure all products are on product index page" do
    visit products_path
    assert_selector ".product__item", count: Product.count
  end
end
