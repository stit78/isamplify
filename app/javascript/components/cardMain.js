const toggleCardMain = () => {
  console.log('coucou');
  const myCards = document.querySelectorAll('.card-box');
  myCards.forEach((card) => {
    card.addEventListener('click', (event) => {
      console.log(event.currentTarget);
      event.currentTarget.classList.toggle('card-box-active');
      event.currentTarget.querySelector('.card-main-details').classList.toggle('card-details-active');
    });
  });
};

export { toggleCardMain };
