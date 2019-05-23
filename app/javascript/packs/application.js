import "bootstrap";
import { flatpickrPageShow, flatpickrPageNewManga } from "../components/date";
import { doneTyping } from "../components/search";

if (document.getElementById('index-page')) {
  doneTyping();
};

if(document.getElementById('show')){
  flatpickrPageShow();
};

if(document.getElementById('new-manga')){
  flatpickrPageNewManga();
};
