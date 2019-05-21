const loanDuration = Number.parseInt(document.getElementById('loan_duration').innerText, 10);
const withdraw = document.getElementById('retrait');
const dayField = document.getElementById('loan_started_at_3i');
const monthField = document.getElementById('loan_started_at_2i');

dayField.addEventListener('blur', (event) => {
  const day = Number.parseInt(document.querySelector('#loan_started_at_3i').value, 10);
  return day;
});

const monthNbr = () => {
  let month = Number.parseInt(document.querySelector('#loan_started_at_2i').value, 10);
  monthField.addEventListener('blur', (event) => {
    month = Number.parseInt(document.querySelector('#loan_started_at_2i').value, 10);
  });
  return month;
}

dayField.addEventListener('blur', (event) => {
  retrieve();
});


const retrieve = () => {
    withdraw.innerText = loanDuration + monthNbr();
  };
