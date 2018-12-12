const toggleCardMain = () => {
  const myCards = document.querySelectorAll('.card-box');
  myCards.forEach((card) => {
    const cardMain = card.querySelector('.card-main-first-skin');
    cardMain.addEventListener('click', (event) => {
      card.classList.toggle('card-box-active');
      cardMain.classList.toggle('card-first-skin-active');
      event.currentTarget.querySelector('.card-main-details').classList.toggle('card-details-active');
    });
  });
};




export { toggleCardMain };
