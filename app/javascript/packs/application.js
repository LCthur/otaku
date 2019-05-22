import "bootstrap";
import { flatpickrPageShow, flatpickrPageNewManga } from "../components/date";

if(document.getElementById('show')){
  flatpickrPageShow();
};

if(document.getElementById('new-manga')){
  flatpickrPageNewManga();
};