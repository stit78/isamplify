import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Hello Amandine, Welcome to iSamplify!"],
    typeSpeed: 50,
    loop: false
  });
};
export {loadDynamicBannerText};
