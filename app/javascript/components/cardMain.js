const toggleCardMain = () => {
  const myCards = document.querySelectorAll('.card-box');
  myCards.forEach((card) => {
    const cardMain = card.querySelector('.card-main');
    cardMain.addEventListener('click', (event) => {
      event.currentTarget.classList.toggle('card-box-active');
      event.currentTarget.querySelector('.card-main-details').classList.toggle('card-details-active');
    });
  });
};

export { toggleCardMain };
