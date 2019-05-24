require 'open-uri'

title: title,
description: Faker::JapaneseMedia::OnePiece.quote,
author: Faker::JapaneseMedia::OnePiece.character,
editor: Faker::JapaneseMedia::OnePiece.sea,
publication_date: Date.today - rand(365..3650),
serie_name: serie_name,
tome_number: i+1,
genre: 'Roman graphique',
pages_number: rand(200..500),

i=0

manga = "one+piece"

url = "https://www.manga-news.com/index.php/recherche/?q=#{manga}"

html_doc = Nokogiri::HTML(open(url).read)

results = []
html_doc.search('.searchCat .resManga a').each do |title|
  results << title.attribute('title').value
end

results = results.map do |result| 
  result.sub("Serie manga - ", "")
end

serie_name = manga.split(/\+/).map do |el|
  el.capitalize!
end.join(" ")

url = html_doc.search('.searchCat .resManga a')[results.index(serie_name)].attribute('href').value

url = "#{url.sub("/serie/", "/manga/")}/vol-#{i+1}"

html_doc = Nokogiri::HTML(open(url).read)

title = html_doc.search('.entrySubTitle.banner_title').text.strip
