const pay = () => {
  console.log("OK")
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: formData.get("user_order[number]"),
      cvc: formData.get("user_order[cvc]"),
      exp_month: formData.get("user_order[exp_month]"),
      exp_year: `20${formData.get("user_order[exp_year]")}`,
    };
    console.log(card);
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
    console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
 
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    }
    // alert("card-error")
    });
  });
 };
 
 window.addEventListener("load", pay);

// document.addEventListener(
//   console.log("ok")
//   "DOMContentLoaded", e => {
//     Payjp.setPublicKey("PAYJP_PUBLIC_KEY");
//     var btn = document.getElementById('charge-form');
//     btn.addEventListener("click", (e) => {
//       e.preventDefault();

//       var card = {
//         number: $("#number").val(),
//         cvc: $("#cvc").val(),
//         exp_month: $("#exp_month").val(),
//         exp_year: $("#exp_year").val()
//       }; 


//       Payjp.createToken(card, (status, response) => {
//         if (status === 200) {
//           $("#number").removeAttr("name");
//           $("#cvc").removeAttr("name");
//           $("#exp_month").removeAttr("name");
//           $("#exp_year").removeAttr("name"); 
//           $("#card_token").append(
//             $('<input type="hidden" name="payjp-token">').val(response.id)
//             document.inputForm.submit();
//             );
//             console.log(status);
//         //   alert("登録が完了しました"); 
//         // } else {
//         //   alert("カード情報が正しくありません。"); 
//         }
//       });
//     });
//   },
//   false
// );