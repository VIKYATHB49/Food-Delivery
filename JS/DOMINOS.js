
const breveragesQuantityInput = document.getElementById('breverages-quantity');
document.getElementById('breverages-increment').addEventListener('click', function() {
let currentValue = parseInt(breveragesQuantityInput.value);
breveragesQuantityInput.value = currentValue + 1;
});
document.getElementById('breverages-decrement').addEventListener('click', function() {
let currentValue = parseInt(breveragesQuantityInput.value);
if (currentValue > 0) {
    breveragesQuantityInput.value = currentValue - 1;
}
});

const pizza_maniaQuantityInput = document.getElementById('pizza-mania-quantity');
document.getElementById('pizza-mania-increment').addEventListener('click', function() {
let currentValue = parseInt(pizza_maniaQuantityInput.value);
pizza_maniaQuantityInput.value = currentValue + 1;
});
document.getElementById('pizza-mania-decrement').addEventListener('click', function() {
let currentValue = parseInt(pizza_maniaQuantityInput.value);
if (currentValue > 0) {
    pizza_maniaQuantityInput.value = currentValue - 1;
}
});

const pastaQuantityInput = document.getElementById('pasta-quantity');
document.getElementById('pasta-increment').addEventListener('click', function() {
let currentValue = parseInt(pastaQuantityInput.value);
pastaQuantityInput.value = currentValue + 1;
});
document.getElementById('pasta-decrement').addEventListener('click', function() {
let currentValue = parseInt(pastaQuantityInput.value);
if (currentValue > 0) {
    pastaQuantityInput.value = currentValue - 1;
}
});
const BurgerquantityInput = document.getElementById('Burger-quantity');
document.getElementById('Burger-increment').addEventListener('click', function() {
let currentValue = parseInt(BurgerquantityInput.value);
BurgerquantityInput.value = currentValue + 1;
});
document.getElementById('Burger-decrement').addEventListener('click', function() {
let currentValue = parseInt(BurgerquantityInput.value);
if (currentValue > 0) {
    BurgerquantityInput.value = currentValue - 1;
}
});
const pizza_quantityInput = document.getElementById('pizza-quantity');
document.getElementById('pizza-increment').addEventListener('click', function() {
let currentValue = parseInt(pizza_quantityInput.value);
pizza_quantityInput.value = currentValue + 1;
});
document.getElementById('pizza-decrement').addEventListener('click', function() {
let currentValue = parseInt(pizza_quantityInput.value);
if (currentValue > 0) {
    pizza_quantityInput.value = currentValue - 1;
}
});
const ToppingsQuantityInput = document.getElementById('Toppings-quantity');
document.getElementById('Toppings-increment').addEventListener('click', function() {
let currentValue = parseInt(ToppingsQuantityInput.value);
ToppingsQuantityInput.value = currentValue + 1;
});
document.getElementById('Toppings-decrement').addEventListener('click', function() {
let currentValue = parseInt(ToppingsQuantityInput.value);
if (currentValue > 0) {
    ToppingsQuantityInput.value = currentValue - 1;
}
});
function updatePrice(itemName) {
    const selectedItem = document.getElementById(`${itemName}-type`);
    const itemPrice = selectedItem.value;
    document.getElementById(`${itemName}-price`).innerText = itemPrice;
    breveragesPrice = itemPrice;
}
