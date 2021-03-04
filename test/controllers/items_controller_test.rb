require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest

  test "Create new item" do
  	cart = carts(:one)
  	product = products(:courgette)
  	item = Item.new(quantity: 5, product_id: product.id, cart_id: cart.id)

  	# Since an item refering to the product courgette doesn't exist
  	# we check if a new item is created when posting to the item controller

    assert_difference("Item.count") do 
    	post items_path, params: { item:  {quantity: item.quantity, product_id: item.product_id, cart_id: item.cart_id}}
    end

    assert_redirected_to products_path
  end

  test "Update existing item" do
  	cart = carts(:one)
  	product = products(:tomate)
  	item = items(:item_first)

  	# Since an item refering to the product tomate already exist 
  	# we store its initial quantity and check if it is updated after going through the create action of item controller

  	quantity = item.quantity
    post items_path, params: { item:  {quantity: (item.quantity + 1), product_id: item.product_id, cart_id: item.cart_id}}
    item.reload
    assert_equal item.quantity, quantity + 1

    assert_redirected_to products_path
  end
end
