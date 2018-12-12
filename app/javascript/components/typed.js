import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Hello Louis, Welcome to iSamplify!"],
    typeSpeed: 50,
    loop: false
  });
};
export {loadDynamicBannerText};
