const scrollUpByResult = () => {
    if (location.search) {
        // document.querySelector('#cards-product').scrollIntoView({ 
        //     behavior: 'smooth' 
        //   });
        $('html, body').animate({scrollTop: $('#search-bar-scroll').offset().top}, 2000);
    }
}

export { scrollUpByResult };
