class Cart < ApplicationRecord
	has_many :items, dependent: :destroy

	def total_ttc
		sum = 0
		self.items.each do |item| 
			sum += item.product.get_ttc_price * item.quantity
		end
		puts "Somme total du panier: #{sum}"
		return sum
	end
end
