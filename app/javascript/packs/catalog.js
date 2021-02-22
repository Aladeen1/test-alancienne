

export const catalog = () => {

	const quantityInputs = document.querySelectorAll('#item_quantity');
	const priceTarget = document.getElementById('total_price');
	const quantityTarget = document.getElementById('total_quantity');
	const form = document.querySelectorAll('#new_item');


	updateTotalLogic(quantityInputs, priceTarget, quantityTarget)

	quantityInputs.forEach( (input) => {

		input.addEventListener('input', event => {
			
			updateTotalLogic(quantityInputs, priceTarget, quantityTarget)
			const formTarget = event.target.parentElement.parentElement.parentElement.parentElement
			formTarget.submit();
		})
	})
}

function updateTotalLogic(quantityInputs, priceTarget, quantityTarget) {
	let array = [];
	quantityInputs.forEach( (field) => {
		array.push(calculatePrice(field))
	});
	updateTotal(array, priceTarget, quantityTarget);
}

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

function calculatePrice(input) {
	const element = input.parentElement.parentElement.parentElement;
	const priceElement = element.querySelectorAll("li")[1].innerHTML;
	const priceCalculation = Number(priceElement.split("€")[0]);
	
	const price = input.value * priceCalculation;
	const quantity = Number(input.value);

	return [price, quantity]
}













