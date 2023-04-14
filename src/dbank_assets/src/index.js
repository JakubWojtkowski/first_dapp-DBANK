import { dbank } from "../../declarations/dbank";

window.addEventListener("load", async () => {
  // console.log("Finished loading");
  update();
});

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault();

  const btn = event.target.querySelector("#submit-btn");

  const inputAmount = document.getElementById("input-amount").value;
  const withdrawalAmount = document.getElementById("withdrawal-amount").value;

  btn.setAttribute("disabled", true);

  if (inputAmount.length != 0) {
    await dbank.topUp(parseFloat(inputAmount));
  }

  if (withdrawalAmount.length != 0) {
    await dbank.withdrawl(parseFloat(withdrawalAmount));
  }

  await dbank.compound();

  update();

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";

  btn.removeAttribute("disabled");
});

async function update() {
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
}
