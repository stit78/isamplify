import swal from 'sweetalert';

const sweetAlertCustom = () => {

    if (document.querySelectorAll(".card-box").length == document.querySelectorAll(".hide").length) {
        swal({
        title: "Good job Louis",
        text: "You have finished samplifying",
        icon: "success",
        });
    }

};

export { sweetAlertCustom };
