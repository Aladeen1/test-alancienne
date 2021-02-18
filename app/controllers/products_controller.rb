class ProductsController < ApplicationController
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save!

		redirect_to new_product_path
	end

	private 

	def product_params
  	  params.require(:product).permit(:name, :price_ht, :tva, :stock_available, :stock_ordered)
  	end
end
