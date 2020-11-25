const buttonReviewFunction = () => {
  const buttonReview = document.querySelector("#leavereview");

  if (buttonReview) {
    buttonReview.addEventListener("click", (event) => {
      const hide = document.querySelector("#tohide")
      console.log(hide);
      hide.classList.toggle("d-block");

    });
  }



}


export {buttonReviewFunction};
