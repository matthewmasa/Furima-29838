// function price() {
//  console.log("aaa")
// }
//
// const priceInput = document.getElementById("item-price");
// const add_tax = document.getElementById("add-tax-price");
// const profit = document.getElementById("profit");
// console.log("bbb");
//     priceInput.addEventListener('keyup', () => {
//     const value = priceInput.value;
//
//     if (value >= 300 && value <= 9999999){
//         console.log("cccc")
//         let fee = value * 0.1
//         let gains = value - fee
//         add_tax.textContent = fee;
//         profit.textContent = gains;
//     } else {
//         let fee = '-';
//         let gains = '-';
//         add_tax.textContent = fee;
//         profit.textContent = gains;
//     }
// });
//
// window.addEventListener('load', price);

function price(){
    const priceInput = document.getElementById("item-price");
    const fee = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    priceInput.addEventListener("input", function(){
        const input_value = priceInput.value;

        let money = input_value * 0.1;
        let gains = input_value - money;

        fee.innerHTML = money
        profit.innerHTML = gains
    })
};

window.addEventListener(`load`, price);