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

function price() {
    const item_price = document.getElementById("item-price");
    const add_tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    item_price.addEventListener("input", (e) => {

        const value = item_price.value
        if(value >= 300 && value <= 9999999){
            let fee = Math.floor(value * 0.1)
            let gain = value - fee;
            add_tax.innerHTML = fee;
            profit.innerHTML = gain;
        } else {
            let fee = '0';
            let gain = '0';
            add_tax.innerHTML = fee;
            profit.innerHTML = gain;
        }
    });
}
window.addEventListener("load", price);