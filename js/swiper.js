// Swiper 
var swiper = new Swiper(".mySwiper", {
    rewind: true,
    loop: true,
    speed: 1500,
    parallax: true,
    autoplay: {
        deslay: 75000,
        disableOnInteraction: false,
    },
    pagination: {
        el: ".swiper-pagination",
        type: "progressbar",
    },
});