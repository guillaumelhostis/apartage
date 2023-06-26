# cleaning DB

puts "cleaning DB...."
# Quizz.delete_all
# Rental.delete_all
# Your_space.delete_all
Rental.delete_all
YourSpace.delete_all
Quizz.delete_all
Flat.delete_all
User.delete_all

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

puts "creating a quizz for Paul"

paul_quizz = Quizz.create(
  smoker: "A",
  talker: "B",
  guest: "C",
  user_id: paul[:id]
)


puts "creating your space for Paul appartement"

YourSpace.create(
  tv: true,
  bathroom: true,
  wifi: true,
  toilet: true,
  terrasse: true,
  flat_id: paul_flat[:id]
)
