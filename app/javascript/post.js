function conversion() {
  const itemPrice = document.getElementById("item-price").value;
  const addTaxPrice =  document.getElementById("add-tax-price");  
  const profit = document.getElementById("profit");
  addTaxPrice.innerHTML = Math.trunc(itemPrice * 0.1).toLocaleString();
  profit.innerHTML =  Math.trunc(itemPrice - (itemPrice * 0.1)).toLocaleString();
};

window.addEventListener('input', conversion);
