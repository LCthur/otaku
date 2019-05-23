import "bootstrap";
import { flatpickrPageShow, flatpickrPageNewManga } from "../components/date";
import { searchKeyUp } from "../components/search";

if (document.getElementById('index-page')) {
  searchKeyUp();
};

if(document.getElementById('show')){
  flatpickrPageShow();
};

if(document.getElementById('new-manga')){
  flatpickrPageNewManga();
};
