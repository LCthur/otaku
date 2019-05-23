const scrollUpByResult = () => {
    if (location.search) {
        // window.location.href = "#cards-product";
        // document.querySelector('#cards-product').scrollIntoView({ 
        //     behavior: 'smooth' 
        //   });
        $('html, body').animate({scrollTop: $('#cards-product').offset().top}, 2000);
    }
}

export { scrollUpByResult };