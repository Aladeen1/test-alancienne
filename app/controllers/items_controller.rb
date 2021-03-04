class ItemsController < ApplicationController
	protect_from_forgery
	
	def create
		@cart = Cart.find(item_params[:cart_id])

		# If an item has a reference_key pointing to the current @cart and its product_id is the same as the one in the params
		# then it is assigned to the @item instance variable otherwise @item = nil.

		@item = check_item(@cart.id, item_params[:product_id].to_i)

		# If an item already exists for the @cart and product sent in params then we update the item otherwise we create a new one

		@item ? @item.update(quantity: item_params[:quantity]) : @item = Item.create(item_params)
		
		redirect_to products_path
	end

	private 

	def item_params
  	  params.require(:item).permit(:quantity, :product_id, :cart_id)
  	end
end
