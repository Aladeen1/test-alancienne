

	const quantityInputs = document.querySelectorAll('#product_quantity');
	const priceTarget = document.getElementById('total_price');
	const quantityTarget = document.getElementById('total_quantity');

	quantityInputs.forEach( (input) => {

		input.addEventListener('input', event => {
			let array = [];

			quantityInputs.forEach( (field) => {
				array.push(calculatePrice(field))
			})

			updateTotal(array, priceTarget, quantityTarget)
		})
	})

function updateTotal(array, priceTarget, quantityTarget) {
	let totalPrice = 0;
	let totalQuantity = 0;

	array.forEach( element => {
		totalPrice += element[0];
		totalQuantity += element[1];
	})

	priceTarget.innerHTML = `${totalPrice} €`
	quantityTarget.innerHTML = `${totalQuantity}`
}


function calculatePrice(input) {
	const element = input.parentElement.parentElement;
	const priceElement = element.querySelectorAll("li")[1].innerHTML;
	const priceCalculation = Number(priceElement.split("€")[0]);
	
	const price = input.value * priceCalculation;
	const quantity = Number(input.value);

	return [price, quantity]
}













