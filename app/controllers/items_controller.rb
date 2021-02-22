class ItemsController < ApplicationController
	protect_from_forgery
	
	def create

		@cart = Cart.find(item_params[:cart_id])

		# If the cart already has an item with a product_id corresponding to the one that is passed in the params,
		# find and update that item
		# If it doesn't, create that item
		
		if @cart.items.any?{|i| i.product_id == item_params[:product_id].to_i }
			item_index = @cart.items.find_index {|i| i.product_id == item_params[:product_id].to_i }
			@item = Item.find(@cart.items[item_index].id)
			@item.update(quantity: item_params[:quantity])
		else
			@item = Item.new(item_params)
			@item.save!
		end

		redirect_to products_path
	end

	private 

	def item_params
  	  params.require(:item).permit(:quantity, :product_id, :cart_id)
  	end
end
