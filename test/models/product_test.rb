require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@product = products(:courgette)
  end


  test "Get immediate available stock of a product" do
  	assert_equal @product.get_immediate_stock, 38
  end

  test "Get ttc price in a correct format" do
  	assert_equal @product.get_ttc_price, 4.22
  end
end
