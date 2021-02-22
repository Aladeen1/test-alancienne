class CartsController < ApplicationController
	def close
		
		# Receive params when user clicks on "commander"


		# Find the corresponding cart and update its checked_out attribute
		@cart = Cart.find(cart_params[:cart_id])
		@cart.update(checked_out: true)
		

		# For each item of that cart, update the stock ordered for the product of an item 
		# so the immediate stock available can be updated in the view

		@cart.items.each do |item|
			@product = Product.find(item.product_id)
			new_stock_ordered = @product.stock_ordered + item.quantity
			
			@product.update(stock_ordered: new_stock_ordered)
		end

		# Delete the cookie containing cart_id so a new cart can be created for the user when redirected
		cookies.delete :cart_id

		redirect_to products_path
	end


	private 

	def cart_params
  	  params.require(:random).permit(:cart_id)
  	end

end
