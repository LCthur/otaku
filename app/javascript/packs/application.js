import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
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


initMapbox();
