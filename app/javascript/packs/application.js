import 'bootstrap';
import { flatpickrPageShow, flatpickrPageNewManga } from '../components/date';
import { retrieveMangaData } from '../components/manga_api';

retrieveMangaData(1223);

if(document.getElementById('show')){
  flatpickrPageShow();
};

if(document.getElementById('new-manga')){
  flatpickrPageNewManga();
};
