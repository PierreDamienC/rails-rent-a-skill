const fillStars = (rating) => {
    for (let index = 1; index <= 5; index++) {
      const star = document.getElementById(index);
      if (index <= rating) {
        star.className = "review-rating fas fa-star"
      } else {
        star.className = "review-rating far fa-star"
      }
    }
  };
  
  const updateRatingInput = (rating) => {
    const formInput = document.getElementById('review_rating')
    formInput.value = rating
  }
  
  const dynamicRating = () => {
    // je récupère toutes les étoiles
    const stars = document.querySelectorAll('.review-rating');
    if ( stars.length > 0) {
      stars.forEach((star) => {
        // au clic je récupère la valeur du rating, j'applique le style css et j'ajoute une classe "selected" sur l'étoile
        star.addEventListener("click", (event) => {
          const rating = event.currentTarget.id
          updateRatingInput(rating);
          fillStars(rating);
          star.classList.add("selected")
        });
        star.addEventListener("mouseover", (event) => {
          // s'il n'y a pas de classe "selected" j'applique du style au passage de la souris
          const rating = event.currentTarget.id
          if (!(document.querySelector(".selected"))) {
            fillStars(rating);
          }
        });
      });
    };
  };
  
  export { dynamicRating };