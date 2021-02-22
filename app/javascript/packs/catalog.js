

export const catalog = () => {

	const quantityInputs = document.querySelectorAll('#item_quantity');
	const priceTarget = document.getElementById('total_price');
	const quantityTarget = document.getElementById('total_quantity');
	const form = document.querySelectorAll('#new_item');

	//Update the total quantity and price after loading the view

	updateTotalLogic(quantityInputs, priceTarget, quantityTarget)

	// Update the total quantity and price whenever a user inputs a quantity of a certain product 
	// Also send the form to create or update an item when user inputs this quantity
	quantityInputs.forEach( (input) => {

		input.addEventListener('input', event => {
			
			updateTotalLogic(quantityInputs, priceTarget, quantityTarget)
			// Target the right form related to the product the user wants to order
			const formTarget = event.target.parentElement.parentElement.parentElement.parentElement
			formTarget.submit();
		})
	})
}

// Logic for updating the total price and quantity ordered
// Create an empty array and fill it with the calculated price and quantity for each product
function updateTotalLogic(quantityInputs, priceTarget, quantityTarget) {
	let array = [];
	quantityInputs.forEach( (field) => {
		array.push(calculatePrice(field))
	});
	updateTotal(array, priceTarget, quantityTarget);
}

// Receive and array of all quantity and price calculated for each product
// Calculate the total quantity and price
// Update the total price and quantity field in the view

function updateTotal(array, priceTarget, quantityTarget) {
	let totalPrice = 0;
	let totalQuantity = 0;

	array.forEach( element => {
		totalPrice += element[0];
		totalQuantity += element[1];
	})

	priceTarget.innerHTML = `<strong>${totalPrice.toFixed(2)} €</strong>`;
	quantityTarget.innerHTML = `<strong>${totalQuantity}</strong>`;
}

//Get the price of a product and calculate the cost for user depending on how much quantity the user ordered
//Return the cost and quantity corresponding to what user order for a specific product

function calculatePrice(input) {
	const element = input.parentElement.parentElement.parentElement;
	const priceElement = element.querySelectorAll("li")[1].innerHTML;
	const priceCalculation = Number(priceElement.split("€")[0]);
	
	const price = input.value * priceCalculation;
	const quantity = Number(input.value);

	return [price, quantity]
}













