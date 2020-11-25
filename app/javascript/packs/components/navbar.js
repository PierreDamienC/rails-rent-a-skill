const WhiteNavbar = () => {
    const navbar = document.querySelector('.navbar-home');
    const title = document.querySelector('#title-navbar');
    const star = document.querySelector('#star-home');
    const mainTitleHome = document.getElementById("#main-title");

    if (navbar) {
      navbar.classList.add('navbar-transparent')
    };
    if (title && mainTitleHome) { 
      title.classList.add('d-none');
    };

    if (star) {
      star.addEventListener('click', (event) => {
        console.log('clicked');
        navbar.classList.add('navbar-transparent');
      });
    };

    if (navbar) {
      window.addEventListener('scroll', () => {
      if (window.scrollY <= 550){
        title.classList.add('d-none');
        navbar.classList.add('navbar-transparent');
      } else {
        title.classList.remove('d-none');
        navbar.classList.remove('navbar-transparent');
      }
      });
    }
};

export {WhiteNavbar};

