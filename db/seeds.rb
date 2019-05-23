# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  address: 'Rue du Saut-a-lelastic 1'
}

User.create!(h)

puts 'Creating mangas...'

images_urls = %w[g45lspdga2t8smukzshe p73avptyvavdxksu3qms tadcpzyyjff78hifezxg eupjbrqmj7mk9nuodacn cxsly3vwiullksda6jrb q4n7fepfvjmon7dgy2us gx1a1holbtwzbgll33eu xf9yt3zsfzvhe8bqwdwi dg36p4etii51hvs0e843 jsag8nsxyq2ccp0vbgzu]

10.times do |i|
  url = "https://res.cloudinary.com/ddzk8vfke/image/upload/v1558439473/#{images_urls[i]}.jpg"

  h = {
    title: Faker::JapaneseMedia::OnePiece.akuma_no_mi,
    description: Faker::JapaneseMedia::OnePiece.quote,
    author: Faker::JapaneseMedia::OnePiece.character,
    editor: Faker::JapaneseMedia::OnePiece.sea,
    publication_date: Date.today - rand(365..3650),
    serie_name: 'One Piece',
    tome_number: i+1,
    genre: 'Roman graphique',
    pages_number: rand(200..500),
    language: 'Français',
    user_id: User.all.last.id,
    loan_duration: rand(10..60)
  }
  manga = Manga.new(h)
  manga.remote_photo_url = url
  manga.save!
end

puts 'Finished!'
