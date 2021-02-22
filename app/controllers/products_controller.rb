class ProductsController < ApplicationController
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save!

		redirect_to new_product_path
	end

	def index
		@item = Item.new
		@products = Product.all

		# If the cookie cart_id doesn't exist, we create a cart and save it. We assign its ID to the cookie cart_id
		# If this cookie exist, we find the corresponding cart and assign it to the instance variable @cart
		
		if !cookies[:cart_id]
			@cart = Cart.new
			@cart.save
			cookies[:cart_id] = @cart.id
		else
			@cart = Cart.find(cookies[:cart_id])
		end

	end

	private 

	def product_params
  	  params.require(:product).permit(:name, :price_ht, :tva, :stock_available, :stock_ordered)
  	end
end
