import "bootstrap";
import flatpickr from 'flatpickr';
import 'flatpickr/dist/themes/airbnb.css'
import { French } from "flatpickr/dist/l10n/fr.js"

const months = ["janvier", "février", "mars", "avril", "mai", "juin", "juillet", "août", "septembre", "octobre", "novembre", "décembre"];

const daysLeft = (date, additionalDays) => {
  return new Date(date.setDate(date.getDate() + additionalDays));
}

const flatpickrPageShow = () => {
  flatpickr(".datepicker", {
    "locale": French,
    minDate : new Date(),
    altInput: true,
    altFormat: "d M Y",
    onChange: function(dateObj) {
      const additionalDays = parseInt(document.getElementById('loan_duration').dataset.value);
      const d = daysLeft(dateObj[0], additionalDays);
      document.getElementById('returning-date').innerHTML = d.getDate() + " " + months[d.getMonth()] + " " + d.getFullYear();
    }
  });
}

const flatpickrPageNewManga = () => {
  flatpickr(".datepicker", {
    "locale": French,
    altInput: true,
    altFormat: "d M Y",
  });
}

if(document.getElementById('show')){
  flatpickrPageShow();
};

if(document.getElementById('new-manga')){
  flatpickrPageNewManga();
};