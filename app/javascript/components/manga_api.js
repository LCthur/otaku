var unirest = require('unirest');

const retrieveMangaData = (mangaId) => {
  const response = unirest.get(`https://animenewsnetwork.p.rapidapi.com/api.xml?manga=${mangaId}`)
    .header("X-RapidAPI-Host", "animenewsnetwork.p.rapidapi.com")
    .header("X-RapidAPI-Key", "494935c1f8mshfe8150eb5997d29p159d88jsn438647506c09")
    .end(function (result) {
      console.log(result.status, result.headers, result.body);
    });
}

// const { ProxyFetcher, Scraper } = require('bedetheque-scraper')
// // or using CommonJS
// // import { ProxyFetcher, Scraper } from 'bedetheque-scraper'

// async function bedethequeScraper() {
//   const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0'.split('');
//   for (const letter of letters) {
//     const proxyList = await ProxyFetcher.getFreeProxyList();

//     const [series, authors] = await Promise.all([
//       Scraper.scrapeSeries(proxyList, letter),
//       Scraper.scrapeAuthors(proxyList, letter),
//     ]);

//     console.log(`${letter} done with ${series.length} series and ${authors.length} authors`);
//   }
// }

export { retrieveMangaData };