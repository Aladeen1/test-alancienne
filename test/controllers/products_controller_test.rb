require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  
  	test "Show new product page" do
  		get root_path
  		assert_response :success
 	end

  	test "Create new product" do
	  	assert_difference("Product.count") do
	    	post products_path, params: { product: { name: "Abricot", price_ht: 6.70, tva: "reduced_tva", stock_available: 34, stock_ordered: 13} }
	  	end

	  	assert_redirected_to products_path
  	end

  	test "Create cart when customer visit products index for the first time or has not checked out existing cart" do
  		if cookies[:cart_id]
	  		assert_no_difference("Cart.count") do
	  			get products_path
	  		end
	  	else 
	  		assert_difference("Cart.count") do
	  			get products_path
	  		end
	  	end

	  	assert_response :success
  	end
end
