const closeModal = () => {
  let modalButton = document.querySelector(".modal_save")
  modalButton.addEventListener('click', (event) => {
    let modalContainer = document.querySelector(".modal");
    modalContainer.modal('toggle')
    });
};

export { closeModal };
