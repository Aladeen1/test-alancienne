require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  	
  	test "Update cart when customer orders" do
  		# user's cart
  		cart = carts(:one)

  		# when user click on order
	  	post carts_path, params: { random: { cart_id: cart.id}}
	  	assert_redirected_to products_path

	  	# reassign cart to update it with the newly updated attributes
	  	cart.reload
	  	assert_equal true, cart.checked_out
	end
end
