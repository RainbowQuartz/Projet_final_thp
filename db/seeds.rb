# Seed for follow and unfollow test 
require 'faker'

User.create!(first_name:  "chris",
            last_name: "dupont",
             email: "thp@thprennes.com",
             bio: "thp",
             postal_code: 35000,
             city: "Rennes", 
             country: "France",
             birthdate: "01/01/2000",
             password:              "foobar",
             password_confirmation: "foobar",
             )

99.times do |n|
  first_name  = Faker::Name.name
  last_name  = Faker::Name.name
  email = "example-#{n+1}@thprennes.com"
  password = "password"
  User.create!(first_name:  first_name,
                last_name: last_name,
                email: email,
                bio: "thp",
                postal_code: 35000,
                city: "Rennes", 
                country: "France",
                birthdate: "01/01/2000",
                password:              password,
                password_confirmation: password,
                 )
end


# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


Language.create(name: 'Allemand')
Language.create(name: 'Russe')
Language.create(name: 'Français')
Language.create(name: 'Italien')
Language.create(name: 'Anglais')
Language.create(name: 'Espagnol')
Language.create(name: 'Polonais')
Language.create(name: 'Azeri')
Language.create(name: 'Roumain')
Language.create(name: 'Néerlandais')
Language.create(name: 'Turc')
Language.create(name: 'Grec')
Language.create(name: 'Hongrois')
Language.create(name: 'Tchèque')
Language.create(name: 'Catalan')
Language.create(name: 'Portugais')
Language.create(name: 'Suedois')
Language.create(name: 'Serbe')
Language.create(name: 'Bulgare')
Language.create(name: 'Croate')
Language.create(name: 'Arménien')
Language.create(name: 'Danois')
Language.create(name: 'Finnois')
Language.create(name: 'Albanais')
Language.create(name: 'Kazakh')
Language.create(name: 'Slovaque')
Language.create(name: 'Norvégien')
Language.create(name: 'Géorgien')
Language.create(name: 'Biélorusse')
Language.create(name: 'Lituanien')
Language.create(name: 'Bosnien')
Language.create(name: 'Slovène')
Language.create(name: 'Letton')
Language.create(name: 'Estonien')
Language.create(name: 'Islandais')
Language.create(name: 'Irlandais')
Language.create(name: 'Breton')
Language.create(name: 'Flamand')
Language.create(name: 'Basque')
Language.create(name: 'Arabe')
Language.create(name: 'Swahili')
Language.create(name: 'Lingala')
Language.create(name: 'Kinyirwanda')
Language.create(name: 'Kirundi')
Language.create(name: 'Zoulou')
Language.create(name: 'Xhosa')
Language.create(name: 'Yoruba')
Language.create(name: 'Ibo')
Language.create(name: 'Pulaar')
Language.create(name: 'Berbère')
Language.create(name: 'Tamachek')
Language.create(name: 'Haoussa')
Language.create(name: 'Oromo')
Language.create(name: 'Amharique')
Language.create(name: 'Songhai')
Language.create(name: 'Créole')
Language.create(name: 'Quechua')
Language.create(name: 'Aymara')
Language.create(name: 'Mapudundun')
Language.create(name: 'Guarani')
Language.create(name: 'Patchou')
Language.create(name: 'Bengali')
Language.create(name: 'Birman')
Language.create(name: 'Dzongkha')
Language.create(name: 'Malais')
Language.create(name: 'Khmer')
Language.create(name: 'Mandarin')
Language.create(name: 'Cantonais')
Language.create(name: 'Coréen')
Language.create(name: 'Hindi')
Language.create(name: 'Indonésien')
Language.create(name: 'Farsi')
Language.create(name: 'Hébreu')
Language.create(name: 'Japonais')
Language.create(name: 'Kirghiz')
Language.create(name: 'Laotien')
Language.create(name: 'Maldivien')
Language.create(name: 'Khalkha')
Language.create(name: 'Népali')
Language.create(name: 'Ouzbek')
Language.create(name: 'Ourdou')
Language.create(name: 'Filipino')
Language.create(name: 'Tamoul')
Language.create(name: 'Singhalais')
Language.create(name: 'Tadjik')
Language.create(name: 'Thaï')
Language.create(name: 'Tétum')
Language.create(name: 'Turkmène')
Language.create(name: 'Vietnamien')
Language.create(name: 'Chamorro')
Language.create(name: 'Hawaïen')
Language.create(name: 'Kiribati')
Language.create(name: 'Maori')
Language.create(name: 'Samoan')
Language.create(name: 'Tonguien')
Language.create(name: 'Tuvaluan')
Language.create(name: 'Bichmalar')

Interest.create(name: 'Sport')
Interest.create(name: 'Football')
Interest.create(name: 'Basketball')
Interest.create(name: 'Arts martiaux')
Interest.create(name: 'Escalade')
Interest.create(name: 'Natation')
Interest.create(name: 'Cinema')
Interest.create(name: 'Théatre')
Interest.create(name: 'Séries')
Interest.create(name: 'Romans')
Interest.create(name: 'Bande déssinée')
Interest.create(name: 'Comics')
Interest.create(name: 'Dessin')
Interest.create(name: 'Peinture')
Interest.create(name: 'Sculpture')
Interest.create(name: 'Musique')
Interest.create(name: 'Nourriture')
Interest.create(name: 'Cuisine')
Interest.create(name: 'Histoire')
Interest.create(name: 'Géographie')
Interest.create(name: 'Science fiction')
Interest.create(name: 'Fantasy')
Interest.create(name: 'Animaux')
Interest.create(name: 'Nature')
