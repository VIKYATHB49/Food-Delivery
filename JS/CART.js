function biryani() {
    addToCart('Biryani', 700, 'biryani-quantity');
    alert('Biryani', 'biryani-quantity');
}
function kadhaichicken() {
    addToCart('Kadhai-Chicken', 180, 'kadhai-chicken-quantity');
    alert('Kadhai-Chicken', 'kadhai-chicken-quantity');
}
function butternaan() {
    addToCart('Butter-naan', 40, 'butter-naan-quantity');
    alert('Butter-naan', 'butter-naan-quantity');
}
function noodles() {
    addToCart('Noodles', 150, 'noodles-quantity');
    alert('Noodles', 'noodles-quantity');
}
function paneer_65() {
    addToCart('paneer_65', 400, 'paneer_65-quantity');
    alert('paneer_65', 'paneer_65-quantity');
}
function coke() {
    addToCart('coke', 50, 'coke-quantity');
    alert('coke', 'coke-quantity');
}
function pizza() {
    const pizzaType = document.getElementById('pizza-type');
    const itemPrice = parseInt(pizzaType.value); 
    const pizzaName = pizzaType.options[pizzaType.selectedIndex].text; 
    const quantityInput = document.getElementById('pizza-quantity');
    const quantity = parseInt(quantityInput.value);
    const alertBox = document.getElementById("alert");

    if (!itemPrice || !quantity || quantity <= 0) {
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "red";
        alertBox.innerHTML = "Oops! Please select a valid Pizza type and quantity.";

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    } else {
        addToCart(pizzaName, itemPrice, 'pizza-quantity');
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "green";
        alertBox.innerHTML = `Success! ${pizzaName} is added to the cart.`;

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    }
}


function breverages() {
    const breveragesType = document.getElementById('breverages-type');
    const itemPrice = parseInt(breveragesType.value);
    const breveragesName = breveragesType.options[breveragesType.selectedIndex].text;
    const quantityInput = document.getElementById('breverages-quantity');
    const quantity = parseInt(quantityInput.value);
    const alertBox = document.getElementById("alert");

    if (!itemPrice || !quantity || quantity <= 0) {
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "red";
        alertBox.innerHTML = "Oops! Please select a valid Beverage type and quantity.";

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    } else {
        addToCart(breveragesName, itemPrice, 'breverages-quantity');
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "green";
        alertBox.innerHTML = `Success! ${breveragesName} is added to the cart.`;

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    }
}

function pizza_mania() {
    const pizzaManiaType = document.getElementById('pizza-mania-type');
    const itemPrice = parseInt(pizzaManiaType.value);
    const pizzaManiaName = pizzaManiaType.options[pizzaManiaType.selectedIndex].text;
    const quantityInput = document.getElementById('pizza-mania-quantity');
    const quantity = parseInt(quantityInput.value);
    const alertBox = document.getElementById("alert");

    if (!itemPrice || !quantity || quantity <= 0) {
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "red";
        alertBox.innerHTML = "Oops! Please select a valid Pizza Mania type and quantity.";

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    } else {
        addToCart(pizzaManiaName, itemPrice, 'pizza-mania-quantity');
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "green";
        alertBox.innerHTML = `Success! ${pizzaManiaName} is added to the cart.`;

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    }
}

function pasta() {
    const pastaType = document.getElementById('pasta-type');
    const itemPrice = parseInt(pastaType.value);
    const pastaName = pastaType.options[pastaType.selectedIndex].text;
    const quantityInput = document.getElementById('pasta-quantity');
    const quantity = parseInt(quantityInput.value);
    const alertBox = document.getElementById("alert");

    if (!itemPrice || !quantity || quantity <= 0) {
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "red";
        alertBox.innerHTML = "Oops! Please select a valid Pasta type and quantity.";

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    } else {
        addToCart(pastaName, itemPrice, 'pasta-quantity');
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "green";
        alertBox.innerHTML = `Success! ${pastaName} is added to the cart.`;

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    }
}

function burger() {
    const burgerType = document.getElementById('Burger-type');
    const itemPrice = parseInt(burgerType.value);
    const burgerName = burgerType.options[burgerType.selectedIndex].text;
    const quantityInput = document.getElementById('Burger-quantity');
    const quantity = parseInt(quantityInput.value);
    const alertBox = document.getElementById("alert");

    if (!itemPrice || !quantity || quantity <= 0) {
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "red";
        alertBox.innerHTML = "Oops! Please select a valid Burger type and quantity.";

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    } else {
        addToCart(burgerName, itemPrice, 'Burger-quantity');
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "green";
        alertBox.innerHTML = `Success! ${burgerName} is added to the cart.`;

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    }
}
function Toppings() {
    const toppingsType = document.getElementById('Toppings-type');
    const itemPrice = parseInt(toppingsType.value);
    const toppingsName = toppingsType.options[toppingsType.selectedIndex].text;
    const quantityInput = document.getElementById('Toppings-quantity');
    const quantity = parseInt(quantityInput.value);
    const alertBox = document.getElementById("alert");

    if (!itemPrice || !quantity || quantity <= 0) {
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "red";
        alertBox.innerHTML = "Oops! Please select a valid Toppings type and quantity.";

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    } else {
        addToCart(toppingsName, itemPrice, 'Toppings-quantity');
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "green";
        alertBox.innerHTML = `Success! ${toppingsName} is added to the cart.`;

        setTimeout(() => {
            alertBox.style.display = "none";
        }, 2000);
    }
}
function alert(itemName, inputId) {
    const quantity = parseInt(document.getElementById(inputId).value);
    const alertBox = document.getElementById("alert");

    if (quantity === 0) {
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "red";
        alertBox.innerHTML = `Oops! ${itemName} Quantity is not selected`;

        setTimeout(function () {
            alertBox.style.display = "none";
        }, 2000);
    } else {
        alertBox.style.display = "block";
        alertBox.style.backgroundColor = "green";
        alertBox.innerHTML = `Success! ${itemName} is added to the cart`;

        setTimeout(function () {
            alertBox.style.display = "none";
        }, 2000);
    }
}
function addToCart(itemName, itemPrice, inputId) {
    const quantity = parseInt(document.getElementById(inputId).value);
    if (quantity > 0) {
        const storedCart = sessionStorage.getItem('cartData');
        let cart = {};
        if (storedCart) {
            cart = JSON.parse(storedCart);
        }
        if (cart[itemName]) {
            cart[itemName].quantity += quantity;
        } else {
            cart[itemName] = { price: itemPrice, quantity };
        }
        sessionStorage.setItem('cartData', JSON.stringify(cart));
    }
}

function updateCart() {
    const storedCart = sessionStorage.getItem('cartData');
    let cart = {};
    if (storedCart) {
        cart = JSON.parse(storedCart);
    }
    let totalCost = 0;
    for (const itemName in cart) {
        const item = cart[itemName];
        totalCost += item.price * item.quantity;
    }
    const tax = totalCost * 0.1;
    const deliveryTax = 50.0;
    const amountToPay = totalCost + tax + deliveryTax;
    const amountDisplay = document.getElementById('amount-to-pay');
    if (amountDisplay) {
        amountDisplay.textContent = amountToPay.toFixed(2);
    }
    const detailsTable = document.getElementById('summary-details');
    if (detailsTable) {
        detailsTable.querySelector('#total-cost').textContent = totalCost.toFixed(2);
        detailsTable.querySelector('#tax').textContent = tax.toFixed(2);
        detailsTable.querySelector('#delivery-tax').textContent = deliveryTax.toFixed(2);
        detailsTable.querySelector('#amount-to-pay').textContent = amountToPay.toFixed(2);
    }

    displayCartItems(cart);
}

function displayCartItems(cart) {
    const cartItemsContainer = document.querySelector('.cart-items');
    const emptyCartMessage = document.getElementById('empty-cart-message');
    const main = document.getElementById('main');
    cartItemsContainer.innerHTML = '';
    if (Object.keys(cart).length === 0) { 
        emptyCartMessage.style.display = 'block';
        main.style.display = 'none';
    } else {
        emptyCartMessage.style.display = 'none';
        main.style.display = 'block';
        for (const itemName in cart) {
            const item = cart[itemName];
            const cartItemDiv = document.createElement('div');
            cartItemDiv.classList.add('cart-item');
            cartItemDiv.style.position = 'relative'; 
            const format = ['jpg', 'jpeg', 'png', 'webp'];
            const itemImage = document.createElement('img');
            const basePath = '../IMAGES/';
            let imageFound = false;

            itemImage.style.width = '100%'; 
            itemImage.style.height = '200px';

            format.forEach(ext => {
                if (!imageFound) {
                    const img = new Image();
                    img.src = `${basePath}${itemName}.${ext}`;

                    img.onload = function () {
                        if (!imageFound) {
                            itemImage.src = img.src;
                            imageFound = true;
                        }
                    };
                }
            });
            cartItemDiv.appendChild(itemImage);
            const checkbox = document.createElement('input');
            checkbox.type = 'checkbox';
            checkbox.setAttribute('data-item-name', itemName);
            checkbox.style.width = '25px'; 
            checkbox.style.height = '25px';
            checkbox.style.position = 'absolute';
            checkbox.style.bottom = '10px';
            checkbox.style.right = '10px';
            cartItemDiv.appendChild(checkbox);
            const itemDetails = document.createElement('div');
            itemDetails.innerHTML = `
                <h4>${itemName}</h4>
                <p>Price: Rs.${item.price.toFixed(2)}<br>Quantity: ${item.quantity}</p>`;
            cartItemDiv.appendChild(itemDetails);

            cartItemsContainer.appendChild(cartItemDiv);
        }
    }
}
updateCart();
document.getElementById('delete-selected-button').addEventListener('click', deleteSelectedItems);
function deleteSelectedItems() {
    const selectedItems = document.querySelectorAll('input[type="checkbox"]:checked');
    selectedItems.forEach((selectedItem) => {
        const itemName = selectedItem.getAttribute('data-item-name');
        const storedCart = sessionStorage.getItem('cartData');
        let cart = {};
        if (storedCart) {
            cart = JSON.parse(storedCart);
        }
        delete cart[itemName];
        sessionStorage.setItem('cartData', JSON.stringify(cart));
    });
    updateCart();
}
let couponApplied = false;
function applyCoupon() {
    const couponInput = document.getElementById('coupon').value.trim();
    const validCoupons = {
    "WELCOME49": 49,  
    "STAR5": 0.05,   
    "BURGER50": 50  
    };
    const amountToPayElement = document.getElementById('amount-to-pay');
    const alertElement = document.getElementById('alert');
    let currentAmount = parseFloat(amountToPayElement.textContent);
    
    if (couponApplied) {
    alertElement.textContent = 'Coupon has already been applied.';
    alertElement.className = 'alert alert-warning';
    alertElement.style.display = 'block';
    setTimeout(() => {
        alertElement.style.display = 'none';
    }, 2000);
    return;
    }
    if (validCoupons[couponInput]) {
    let discount = 0;
    if (validCoupons[couponInput] < 1) {
        discount = currentAmount * validCoupons[couponInput];
    } else {
        discount = validCoupons[couponInput];
    }
    currentAmount -= discount;
    amountToPayElement.textContent = currentAmount.toFixed(2);
    
    localStorage.setItem('currentAmount', currentAmount.toFixed(2));
    
    alertElement.textContent = `Success! ${couponInput} applied. You saved Rs.${discount.toFixed(2)}.`;
    alertElement.className = 'alert alert-success';
    alertElement.style.display = 'block';
    setTimeout(() => {
        alertElement.style.display = 'none';
    }, 2000);
    couponApplied = true; 
    } else {
    alertElement.textContent = 'Invalid coupon code. Please try again.';
    alertElement.className = 'alert alert-danger';
    alertElement.style.display = 'block';
    setTimeout(() => {
        alertElement.style.display = 'none';
    }, 2000);
    }
    }
    
document.getElementById("add-new-address").onclick = () => {
    document.getElementById("popup-overlay").style.display = "flex";
};
document.getElementById("close-popup").onclick = () => {
    document.getElementById("popup-overlay").style.display = "none";
};

