# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  user = User.create!(name: Faker::Name.name, age: rand(1..100))
  10.times do
    user.books.create!(title: Faker::Lorem::sentence(word_count: 5),
                       body: Faker::Lorem::paragraph(sentence_count: 4))
  end
end