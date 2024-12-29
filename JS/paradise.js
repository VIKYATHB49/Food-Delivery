//biryani
const biryaniQuantityInput = document.getElementById('biryani-quantity');
document.getElementById('biryani-increment').addEventListener('click', function() {
let currentValue = parseInt(biryaniQuantityInput.value);
biryaniQuantityInput.value = currentValue + 1;
});
document.getElementById('biryani-decrement').addEventListener('click', function() {
let currentValue = parseInt(biryaniQuantityInput.value);
if (currentValue > 0) {
biryaniQuantityInput.value = currentValue - 1;
}
});

//Kadhai-Chicken
const kadhaiChickenQuantityInput = document.getElementById('kadhai-chicken-quantity');
document.getElementById('kadhai-chicken-increment').addEventListener('click', function() {
let currentValue = parseInt(kadhaiChickenQuantityInput.value);
kadhaiChickenQuantityInput.value = currentValue + 1;
});
document.getElementById('kadhai-chicken-decrement').addEventListener('click', function() {
let currentValue = parseInt(kadhaiChickenQuantityInput.value);
if (currentValue > 0) {
kadhaiChickenQuantityInput.value = currentValue - 1;
}
});

//Butter-Naan
const butterNaanQuantityInput = document.getElementById('butter-naan-quantity');
document.getElementById('butter-naan-increment').addEventListener('click', function() {
let currentValue = parseInt(butterNaanQuantityInput.value);
butterNaanQuantityInput.value = currentValue + 1;
});
document.getElementById('butter-naan-decrement').addEventListener('click', function() {
let currentValue = parseInt(butterNaanQuantityInput.value);
if (currentValue > 0) {
butterNaanQuantityInput.value = currentValue - 1;
}
});
//noodles
const noodles_quantityInput = document.getElementById('noodles-quantity');
document.getElementById('noodles-increment').addEventListener('click', function() {
let currentValue = parseInt(noodles_quantityInput.value);
noodles_quantityInput.value = currentValue + 1;
});
document.getElementById('noodles-decrement').addEventListener('click', function() {
let currentValue = parseInt(noodles_quantityInput.value);
if (currentValue > 0) {
    noodles_quantityInput.value = currentValue - 1;
}
});
//panner-65
const paneer_65_quantityInput = document.getElementById('paneer_65-quantity');
document.getElementById('paneer_65-increment').addEventListener('click', function() {
let currentValue = parseInt(paneer_65_quantityInput.value);
paneer_65_quantityInput.value = currentValue + 1;
});
document.getElementById('paneer_65-decrement').addEventListener('click', function() {
let currentValue = parseInt(paneer_65_quantityInput.value);
if (currentValue > 0) {
    paneer_65_quantityInput.value = currentValue - 1;
}
});
//coke
const cokeQuantityInput = document.getElementById('coke-quantity');
document.getElementById('coke-increment').addEventListener('click', function() {
let currentValue = parseInt(cokeQuantityInput.value);
cokeQuantityInput.value = currentValue + 1;
});
document.getElementById('coke-decrement').addEventListener('click', function() {
let currentValue = parseInt(cokeQuantityInput.value);
if (currentValue > 0) {
cokeQuantityInput.value = currentValue - 1;
}
});
