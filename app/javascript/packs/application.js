import "bootstrap";
import { flatpickrPageShow, flatpickrPageNewManga } from "../components/date";
import { scrollUpByResult } from "../components/search";

if (document.getElementById('index-page')) {
  scrollUpByResult();
};

if(document.getElementById('show')){
  flatpickrPageShow();
};

if(document.getElementById('new-manga')){
  flatpickrPageNewManga();
};
