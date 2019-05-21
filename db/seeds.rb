# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
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

10.times do |i|
  h = {
    title: Faker::JapaneseMedia::OnePiece.akuma_no_mi,
    description: Faker::JapaneseMedia::OnePiece.quote,
    author: Faker::JapaneseMedia::OnePiece.character,
    editor: Faker::JapaneseMedia::OnePiece.sea,
    publication_date: Date.today,
    serie_name: 'One Piece',
    tome_number: i,
    genre: 'Roman graphique',
    pages_number: rand(200..500),
    language: 'Français',
    user_id: User.all.last.id
  }
  Manga.create!(h)
end

puts 'Finished!'