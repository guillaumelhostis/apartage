require 'open-uri'

# cleaning DB

puts "cleaning DB...."
# Quizz.delete_all
# Rental.delete_all
# Your_space.delete_all

urls = [
  "https://res.cloudinary.com/dtpxg9mp5/image/upload/v1687722525/development/c5pbzfabvrvjgvggv9l2z6qgwxp8.jpg",
  "https://res.cloudinary.com/dtpxg9mp5/image/upload/v1687722523/development/cy3md27sms1ezsktescyeff907fo.jpg"
]

Message.destroy_all
Chatroom.destroy_all
YourSpace.destroy_all
Quizz.destroy_all
Flat.destroy_all
User.destroy_all

puts "creating 10 seniors...."

paul = User.create(
  first_name: "Paul",
  last_name: "Dano",
  gender: "Male",
  birth_day: "1965-12-29",
  email: "paul@gmail.com",
  password: "paul92",
  admin: false,
  role: "senior"
)

gerard = User.create(
  first_name: "Gérard",
  last_name: "Drouot",
  gender: "Male",
  birth_day: "1955-12-29",
  email: "gerard@gmail.com",
  password: "gerard92",
  admin: false,
  role: "senior"
)

jean = User.create(
  first_name: "Jean",
  last_name: "Bon",
  gender: "Male",
  birth_day: "1935-12-29",
  email: "jean@gmail.com",
  password: "jean92",
  admin: false,
  role: "senior"
)

marie = User.create(
  first_name: "Marie",
  last_name: "Lagarde",
  gender: "Female",
  birth_day: "1955-12-29",
  email: "marie@gmail.com",
  password: "marie92",
  admin: false,
  role: "senior"
)

jacques = User.create(
  first_name: "Jacques",
  last_name: "Eddy",
  gender: "male",
  birth_day: "1950-12-29",
  email: "jacques@gmail.com",
  password: "jacques92",
  admin: false,
  role: "senior"
)

emile = User.create(
  first_name: "Emile",
  last_name: "Aimage",
  gender: "male",
  birth_day: "1950-12-29",
  email: "emile@gmail.com",
  password: "emile92",
  admin: false,
  role: "senior"
)

roger = User.create(
  first_name: "Roger",
  last_name: "Lamer",
  gender: "male",
  birth_day: "1978-12-29",
  email: "roger@gmail.com",
  password: "roger92",
  admin: false,
  role: "senior"
)

georgette = User.create(
  first_name: "Georgette",
  last_name: "Dupont",
  gender: "female",
  birth_day: "1950-12-29",
  email: "georgette@gmail.com",
  password: "georgette92",
  admin: false,
  role: "senior"
)

yvette = User.create(
  first_name: "Yvette",
  last_name: "Delacourt",
  gender: "female",
  birth_day: "1905-12-29",
  email: "yvette@gmail.com",
  password: "yvette92",
  admin: false,
  role: "senior"
)

mariane = User.create(
  first_name: "Mariane",
  last_name: "Belle",
  gender: "female",
  birth_day: "1805-05-29",
  email: "mariane@gmail.com",
  password: "mariane92",
  admin: false,
  role: "senior"
)

puts "creating 2 juniors...."

alice = User.create(
  first_name: "Alice",
  last_name: "Macron",
  gender: "Female",
  birth_day: "2000-12-29",
  email: "alice@gmail.com",
  password: "alice92",
  admin: false,
  role: "junior"
)

leo = User.create(
  first_name: "Leo",
  last_name: "Sarkozy",
  gender: "Male",
  birth_day: "2007-12-29",
  email: "leo@gmail.com",
  password: "leoleo92",
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
  address: "41 quai Pierre Scize",
  city: "Lyon",
  user_id: marie[:id],
  monthly_price: 100,
  type_of_flat: "appartement",
  capacity: 1
)


gerard_flat = Flat.create(
  title: "C'est petit mais c'est cosi",
  address: "22 Rue Malesherbes",
  city: "Lille",
  user_id: gerard[:id],
  monthly_price: 50,
  type_of_flat: "appartement",
  capacity: 1
)

jean_flat = Flat.create(
  title: "Une villa de rêve",
  address: "354 Tettola",
  city: "Saint-Florent",
  user_id: jean[:id],
  monthly_price: 50,
  type_of_flat: "maison",
  capacity: 3
)

jacques_flat = Flat.create(
  title: "Un appart simple",
  address: "39 Cours Julien",
  city: "Marseille",
  user_id: jacques[:id],
  monthly_price: 300,
  type_of_flat: "maison",
  capacity: 1
)

emile_flat = Flat.create(
  title: "Admire la vue",
  address: "5, rue de la Fromagerie",
  city: "Lyon",
  user_id: emile[:id],
  monthly_price: 300,
  type_of_flat: "appartement",
  capacity: 1
)

roger_flat = Flat.create(
  title: "J'ai besoin de compagnie",
  address: "16 Rue Hippolyte Flandrin",
  city: "Lyon",
  user_id: roger[:id],
  monthly_price: 300,
  type_of_flat: "appartement",
  capacity: 1
)

georgette_flat = Flat.create(
  title: "Petite chambre avec balcon",
  address: "10 Rue de Grassi",
  city: "Bordeaux",
  user_id: georgette[:id],
  monthly_price: 100,
  type_of_flat: "appartement",
  capacity: 1
)

yvette_flat = Flat.create(
  title: "Vue sur la mer",
  address: "23 Av. du Maréchal Foch",
  city: "Biarritz",
  user_id: yvette[:id],
  monthly_price: 100,
  type_of_flat: "appartement",
  capacity: 1
)

mariane_flat = Flat.create(
  title: "Dépendance dans mon domaine",
  address: "Rue Serge Gainsbourg",
  city: "Clermont-Ferrand",
  user_id: mariane[:id],
  monthly_price: 100,
  type_of_flat: "maison",
  capacity: 1
)

all_flats = Flat.all

all_flats.each do |flat|
  urls.each do |url|
    file = URI.open(url)
    flat.photos.attach(io: file, filename: "#{SecureRandom.hex}.jpg", content_type: "image/jpeg")
  end
end

puts "creating a quizzs"

paul_quizz = Quizz.create(
  smoker: "E",
  motivation: "A",
  gender: "A",
  animal: "D",
  guest_animal: "D",
  junior_smoker: "D",
  talker: "A",
  guest: "A",
  music: "A",
  user_id: paul[:id]
)

leo_quizz = Quizz.create(
  smoker: "E",
  motivation: "A",
  gender: "A",
  animal: "D",
  guest_animal: "D",
  junior_smoker: "D",
  talker: "A",
  guest: "A",
  music: "A",
  user_id: leo[:id]
)

roger_quizz = Quizz.create(
  smoker: "E",
  motivation: "A",
  gender: "A",
  animal: "D",
  guest_animal: "D",
  junior_smoker: "D",
  talker: "A",
  guest: "A",
  music: "B",
  user_id: roger[:id]
)

gerard_quizz = Quizz.create(
  smoker: "E",
  motivation: "D",
  gender: "C",
  animal: "D",
  guest_animal: "D",
  junior_smoker: "D",
  talker: "C",
  guest: "A",
  music: "B",
  user_id: gerard[:id]
)

jean_quizz = Quizz.create(
  smoker: "D",
  motivation: "E",
  gender: "A",
  animal: "E",
  guest_animal: "E",
  junior_smoker: "D",
  talker: "B",
  guest: "C",
  music: "C",
  user_id: jean[:id]
)

marie_quizz = Quizz.create(
  smoker: "E",
  motivation: "A",
  gender: "A",
  animal: "D",
  guest_animal: "D",
  junior_smoker: "D",
  talker: "B",
  guest: "B",
  music: "A",
  user_id: marie[:id]
)

jacques_quizz = Quizz.create(
  smoker: "D",
  motivation: "E",
  gender: "A",
  animal: "E",
  guest_animal: "E",
  junior_smoker: "D",
  talker: "B",
  guest: "A",
  music: "C",
  user_id: jacques[:id]
)

emile_quizz = Quizz.create(
  smoker: "D",
  motivation: "E",
  gender: "C",
  animal: "E",
  guest_animal: "E",
  junior_smoker: "D",
  talker: "B",
  guest: "B",
  music: "B",
  user_id: emile[:id]
)

georgette_quizz = Quizz.create(
  smoker: "D",
  motivation: "E",
  gender: "C",
  animal: "E",
  guest_animal: "E",
  junior_smoker: "D",
  talker: "B",
  guest: "B",
  music: "B",
  user_id: georgette[:id]
)

yvette_quizz = Quizz.create(
  smoker: "D",
  motivation: "E",
  gender: "C",
  animal: "E",
  guest_animal: "E",
  junior_smoker: "D",
  talker: "C",
  guest: "C",
  music: "C",
  user_id: yvette[:id]
)

mariane_quizz = Quizz.create(
  smoker: "D",
  motivation: "E",
  gender: "A",
  animal: "E",
  guest_animal: "E",
  junior_smoker: "D",
  talker: "A",
  guest: "A",
  music: "A",
  user_id: mariane[:id]
)






puts "creating your space for appartements"

YourSpace.create(
  tv: true,
  bathroom: true,
  wifi: true,
  toilet: true,
  terrasse: true,
  flat_id: paul_flat[:id]
)

YourSpace.create(
  tv: true,
  bathroom: true,
  wifi: true,
  toilet: true,
  terrasse: true,
  flat_id: marie_flat[:id]
)

YourSpace.create(
  tv: true,
  bathroom: true,
  wifi: false,
  toilet: true,
  terrasse: false,
  flat_id: gerard_flat[:id]
)

YourSpace.create(
  tv: false,
  bathroom: true,
  wifi: true,
  toilet: true,
  terrasse: true,
  flat_id: jean_flat[:id]
)

YourSpace.create(
  tv: true,
  bathroom: true,
  wifi: true,
  toilet: true,
  terrasse: true,
  flat_id: jacques_flat[:id]
)

YourSpace.create(
  tv: true,
  bathroom: false,
  wifi: true,
  toilet: false,
  terrasse: true,
  flat_id: emile_flat[:id]
)

YourSpace.create(
  tv: true,
  bathroom: true,
  wifi: true,
  toilet: true,
  terrasse: true,
  flat_id: roger_flat[:id]
)

YourSpace.create(
  tv: true,
  bathroom: false,
  wifi: true,
  toilet: true,
  terrasse: true,
  flat_id: georgette_flat[:id]
)

YourSpace.create(
  tv: true,
  bathroom: true,
  wifi: true,
  toilet: true,
  terrasse: false,
  flat_id: yvette_flat[:id]
)

YourSpace.create(
  tv: true,
  bathroom: true,
  wifi: false,
  toilet: true,
  terrasse: true,
  flat_id: mariane_flat[:id]
)
