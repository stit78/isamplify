import swal from 'sweetalert';

const sweetAlert = () => {
  swal({
  title: "Good job",
  text: "You have finished samplifying",
  icon: "successM",
  });
  // .then(willDelete => {
  // if (willDelete) {
  //   swal("Deleted!", "Your imaginary file has been deleted!", "success");
  // }
  // });
};

export { sweetAlert }
