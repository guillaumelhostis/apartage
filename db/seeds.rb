require 'open-uri'

# cleaning DB

puts "cleaning DB...."
# Quizz.delete_all
# Rental.delete_all
# Your_space.delete_all
Flat.delete_all
User.delete_all

urls = [
  "https://res.cloudinary.com/dtpxg9mp5/image/upload/v1687722525/development/c5pbzfabvrvjgvggv9l2z6qgwxp8.jpg",
  "https://res.cloudinary.com/dtpxg9mp5/image/upload/v1687722523/development/cy3md27sms1ezsktescyeff907fo.jpg"
]

puts "creating 2 seniors...."

paul = User.create(
  first_name: "Paul Senior",
  last_name: "Dano",
  gender: "Male",
  birth_day: "1965-12-29",
  email: "paul@gmail.com",
  password: "paul92",
  admin: false,
  role: "senior"
)

marie = User.create(
  first_name: "Marie Senior",
  last_name: "Lagarde",
  gender: "Female",
  birth_day: "1955-12-29",
  email: "marie@gmail.com",
  password: "marie92",
  admin: false,
  role: "senior"
)

puts "creating 2 juniors...."

alice = User.create(
  first_name: "Alice Junior",
  last_name: "Macron",
  gender: "Female",
  birth_day: "2000-12-29",
  email: "alice@gmail.com",
  password: "alice92",
  admin: false,
  role: "junior"
)

leo = User.create(
  first_name: "Leo Junior",
  last_name: "Sarkozy",
  gender: "Male",
  birth_day: "2007-12-29",
  email: "leo@gmail.com",
  password: "leo92",
  admin: false,
  role: "junior"
)

puts "creating admin user...."

User.create(
  first_name: "Guillaume",
  last_name: "L'Hostis",
  gender: "Male",
  birth_day: "1992-09-28",
  email: "admin@gmail.com",
  password: "admin92",
  admin: true
)

puts "creating some flats..."

paul_flat = Flat.create(
  title: "Grande maison à Lyon",
  address: "1 Rue du Président Édouard Herriot",
  city: "Lyon",
  user_id: paul[:id],
  monthly_price: 300,
  type_of_flat: "maison",
  capacity: 2
)

marie_flat = Flat.create(
  title: "Petit appartement en bord de mer",
  address: "1 Rue Albert de Mun",
  city: "Roscoff",
  user_id: marie[:id],
  monthly_price: 100,
  type_of_flat: "appartement",
  capacity: 1
)

all_flats = Flat.all

all_flats.each do |flat|
  urls.each do |url|
    file = URI.open(url)
    flat.photos.attach(io: file, filename: "#{SecureRandom.hex}.jpg", content_type: "image/jpeg")
  end
end
