class CartsController < ApplicationController
	def close
		
		@cart = Cart.find(cart_params[:cart_id])
		@cart.update(checked_out: true)
		

		@cart.items.each do |item|
			@product = Product.find(item.product_id)
			new_stock_ordered = @product.stock_ordered + item.quantity
			
			@product.update(stock_ordered: new_stock_ordered)
		end

		cookies.delete :cart_id

		redirect_to products_path
	end


	private 

	def cart_params
  	  params.require(:random).permit(:cart_id)
  	end

end
