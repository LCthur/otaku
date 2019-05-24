# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts 'Starting API...'
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


puts 'Cleaning database...'
Loan.destroy_all
Manga.destroy_all
User.destroy_all

puts 'Creating an owner...'
h = {
  first_name: 'Toto',
  last_name: 'Titi',
  password: 'tototiti',
  password_confirmation: 'tototiti',
  phone_number: '+41799999999',
  email: 'toto@titi.com',
  address: 'Chemin du Closel 5, 1020 Renens'
}

User.create!(h)

puts 'Creating mangas...'

# images_urls = %w[g45lspdga2t8smukzshe p73avptyvavdxksu3qms tadcpzyyjff78hifezxg eupjbrqmj7mk9nuodacn cxsly3vwiullksda6jrb q4n7fepfvjmon7dgy2us gx1a1holbtwzbgll33eu xf9yt3zsfzvhe8bqwdwi dg36p4etii51hvs0e843 jsag8nsxyq2ccp0vbgzu]

url = "#{url.sub("/serie/", "/manga/")}/vol-0"

10.times do |i|
  # url = "https://res.cloudinary.com/ddzk8vfke/image/upload/v1558439473/#{images_urls[i]}.jpg"
  puts "Manga number: #{i+1}"

  puts url = "#{url.sub("/vol-#{i}", "/vol")}-#{i+1}"

  html_doc = Nokogiri::HTML(open(url).read)

  author = html_doc.xpath('//a[starts-with(@itemprop, "author")]').children[0].text.delete("\n").strip

  publisher = html_doc.xpath('//a[starts-with(@itemprop, "publisher")]').children[0].text.delete("\n").strip

  genre = html_doc.xpath('//a[starts-with(@itemprop, "genre")]').children[0].text.delete("\n").strip
  
  title = html_doc.search('.entrySubTitle.banner_title').text.strip

  description = html_doc.search('.bigsize')[0].text.strip

  image_url = html_doc.search('.entryPicture').attribute('src').value

  date_published = html_doc.xpath('//meta[starts-with(@itemprop, "datePublished")]').attribute('content').value

  pages_number = html_doc.xpath('//span[starts-with(@itemprop, "numberOfPages")]').children[0].text.to_i

  h = {
    title: title,
    description: description,
    author: author,
    editor: publisher,
    publication_date: date_published,
    serie_name: serie_name,
    tome_number: i+1,
    genre: genre,
    pages_number: pages_number,
    language: 'Français',
    user_id: User.all.last.id,
    loan_duration: [7, 14, 21, 28, 35, 42, 49].sample
  }
  manga = Manga.new(h)
  manga.remote_photo_url = image_url
  manga.save!
end

puts 'Finished!'
