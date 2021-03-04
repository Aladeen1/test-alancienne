class ApplicationController < ActionController::Base


	# Returns an item if it has a reference_keys pointing to the cart_id and product_id provided as arguments to the method
	# Otherwise returns nil if no item meet these conditions

	def check_item(cart_id, product_id)
	  	item = Item.where("cart_id = ? AND product_id = ?", cart_id, product_id)[0]
	  	return item
	end
end
