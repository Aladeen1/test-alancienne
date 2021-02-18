class Product < ApplicationRecord
	enum tva: [:normal_tva, :reduced_tva]
	validates :stock_available, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :stock_ordered, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	def get_tva_rate(tva_type)
		if tva_type == "normal_tva"
			return 0.20
		elsif tva_type == "reduced_tva"
			return 0.055
		end
	end


	def get_ttc_price
		tva_rate = get_tva_rate(self.tva)

		ttc_price = self.price_ht + (self.price_ht * tva_rate).round(2)
		print '%.2f' % ttc_price
		return ttc_price
	end

	def get_available_stock
		available_stock = self.stock_available - self.stock_ordered
		return available_stock
	end
end
