const navbarEffectOnScroll = () => {

 const navbar = document.querySelector(".navbar");
 const banner = document.querySelector(".banner");
 const myTripButton = document.getElementById("my-trips-btn");
 let bannerHeight;

 if (navbar) {
   if (banner) {
    bannerHeight = banner.getBoundingClientRect().height;
   } else {
     bannerHeight = 500;
   }
 }

 window.addEventListener("scroll", () => {
   if (window.scrollY >= bannerHeight) {
     navbar.classList.add("navbar-white");
     myTripButton.classList.add("my-trip-black");
     navbar.classList.remove("navbar-transparent");
   } else {
     navbar.classList.remove("navbar-white");
     myTripButton.classList.remove("my-trip-black");
     navbar.classList.add("navbar-transparent");
   }
 });

};

export {navbarEffectOnScroll};
