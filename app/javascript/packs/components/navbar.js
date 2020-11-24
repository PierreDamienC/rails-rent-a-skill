const WhiteNavbar = () => {
    const navbar = document.querySelector('.navbar-home');
    const title = document.querySelector('#title-navbar');
    if (navbar) {
      window.addEventListener('scroll', () => {
      if (window.scrollY >= 550) {
        title.classList.remove('d-none');
        navbar.classList.remove('navbar-transparent');
      } else {
        title.classList.add('d-none');
        navbar.classList.add('navbar-transparent');
      }
      });
    }
};

export {WhiteNavbar}

