import "bootstrap";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css'
import { French } from "flatpickr/dist/l10n/fr.js"

const months = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"];

flatpickr(".datepicker", {
  "locale": French,
  minDate : new Date(),
  altInput: true,
  altFormat: "d M Y",
  onChange: function(dateObj) {
    const additionalDays = parseInt(document.getElementById('loan_duration').dataset.value);
    const d = new Date(dateObj[0].setDate(dateObj[0].getDate() + additionalDays));
    document.getElementById('returning-date').innerHTML = d.getDate() + " " + months[d.getMonth()] + " " + d.getFullYear();
  }
});
