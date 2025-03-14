# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'

User.destroy_all
Equipment.destroy_all

puts "Creating users..."

amber = User.create(first_name: 'Amber', last_name: 'Lee', email: 'amber@example.com', password: 'password')
more = User.create(first_name: 'More', last_name: 'Lee', email: 'more@example.com', password: 'password')

users_collection = Unsplash::User.find('amberleeeeeeeeee').collections.first
file = URI.parse(users_collection.photos.sample.urls.regular).open

amber.photo.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')

file = URI.parse(users_collection.photos.sample.urls.regular).open

more.photo.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')

locations = [
  "1 Rue de Rivoli, 75001 Paris",
  "2 Avenue de l'Opéra, 75001 Paris",
  "3 Rue Saint-Honoré, 75001 Paris",
  "4 Place Vendôme, 75001 Paris",
  "5 Rue de la Paix, 75002 Paris",
  "6 Boulevard des Capucines, 75002 Paris",
  "7 Rue Montmartre, 75002 Paris",
  "8 Rue Réaumur, 75002 Paris",
  "9 Rue du Faubourg Saint-Denis, 75010 Paris",
  "10 Rue La Fayette, 75009 Paris",
  "11 Boulevard Haussmann, 75009 Paris",
  "12 Rue de Châteaudun, 75009 Paris",
  "13 Rue de Maubeuge, 75009 Paris",
  "14 Rue du Faubourg Poissonnière, 75009 Paris",
  "15 Rue de Paradis, 75010 Paris",
  "16 Rue du Château d'Eau, 75010 Paris",
  "17 Rue du Faubourg Saint-Martin, 75010 Paris",
  "18 Rue de Lancry, 75010 Paris",
  "19 Rue de Marseille, 75010 Paris",
  "20 Rue de la Grange aux Belles, 75010 Paris",
  "21 Rue de Belleville, 75020 Paris",
  "22 Rue des Pyrénées, 75020 Paris",
  "23 Rue de Ménilmontant, 75020 Paris",
  "24 Rue de Bagnolet, 75020 Paris",
  "25 Rue d'Avron, 75020 Paris",
  "26 Rue de Charonne, 75011 Paris",
  "27 Rue de la Roquette, 75011 Paris",
  "28 Rue Oberkampf, 75011 Paris",
  "29 Rue Saint-Maur, 75011 Paris",
  "30 Rue de Lappe, 75011 Paris",
  "31 Rue du Faubourg Saint-Antoine, 75011 Paris",
  "32 Rue de Montreuil, 75011 Paris",
  "33 Rue de la Fontaine au Roi, 75011 Paris",
  "34 Rue Jean-Pierre Timbaud, 75011 Paris",
  "35 Rue Amelot, 75011 Paris",
  "36 Rue Sedaine, 75011 Paris",
  "37 Rue de la Folie Méricourt, 75011 Paris",
  "38 Rue de Malte, 75011 Paris",
  "39 Rue Saint-Sébastien, 75011 Paris",
  "40 Rue de Crussol, 75011 Paris",
  "41 Rue de Turenne, 75003 Paris",
  "42 Rue des Archives, 75003 Paris",
  "43 Rue de Bretagne, 75003 Paris",
  "44 Rue Charlot, 75003 Paris",
  "45 Rue de Montmorency, 75003 Paris",
  "46 Rue du Temple, 75003 Paris",
  "47 Rue Vieille du Temple, 75003 Paris",
  "48 Rue des Gravilliers, 75003 Paris",
  "49 Rue Notre-Dame de Nazareth, 75003 Paris",
  "50 Rue Réaumur, 75003 Paris",
  "51 Rue du Pont aux Choux, 75003 Paris",
  "52 Rue de Poitou, 75003 Paris",
  "53 Rue de Saintonge, 75003 Paris",
  "54 Rue Debelleyme, 75003 Paris",
  "55 Rue Froissart, 75003 Paris",
  "56 Rue de Turbigo, 75003 Paris",
  "57 Rue de Picardie, 75003 Paris",
  "58 Rue Dupetit-Thouars, 75003 Paris",
  "59 Rue Perrée, 75003 Paris",
  "60 Rue Béranger, 75003 Paris",
  "61 Rue de la Corderie, 75003 Paris",
  "62 Rue de Franche-Comté, 75003 Paris",
  "63 Rue Gabriel Vicaire, 75003 Paris",
  "64 Rue Meslay, 75003 Paris",
  "65 Rue Notre-Dame de Nazareth, 75003 Paris",
  "66 Rue Volta, 75003 Paris",
  "67 Rue au Maire, 75003 Paris",
  "68 Rue des Vertus, 75003 Paris",
  "69 Rue de Montmorency, 75003 Paris",
  "70 Rue du Bourg l'Abbé, 75003 Paris",
  "71 Rue Saint-Martin, 75003 Paris",
  "72 Rue Quincampoix, 75003 Paris",
  "73 Rue Beaubourg, 75003 Paris",
  "74 Rue Michel le Comte, 75003 Paris",
  "75 Rue Greneta, 75003 Paris",
  "76 Rue du Caire, 75003 Paris",
  "77 Rue d'Aboukir, 75002 Paris",
  "78 Rue de Cléry, 75002 Paris",
  "79 Rue de la Lune, 75002 Paris",
  "80 Rue de Palestro, 75002 Paris",
  "81 Rue Saint-Denis, 75002 Paris",
  "82 Rue de la Cossonnerie, 75001 Paris",
  "83 Rue Berger, 75001 Paris",
  "84 Rue du Louvre, 75001 Paris",
  "85 Rue Coquillière, 75001 Paris",
  "86 Rue Jean-Jacques Rousseau, 75001 Paris",
  "87 Rue du Bouloi, 75001 Paris",
  "88 Rue des Petits Champs, 75001 Paris",
  "89 Rue Croix des Petits Champs, 75001 Paris",
  "90 Rue des Bons Enfants, 75001 Paris",
]



tents_collection = Unsplash::User.find('amberleeeeeeeeee').collections[2]
tools_collection = Unsplash::User.find('amberleeeeeeeeee').collections[1]


puts "Creating tents..."

10.times do |index|
  equipment = Equipment.create(name: "Tent", address: locations[index], price: 40, user: more)
  4.times do
    file = URI.parse(tents_collection.photos.sample.urls.regular).open
    equipment.images.attach(io: file, filename: 'equipment.jpg', content_type: 'image/jpg')
  end
end

puts "Creating tools..."
tools_collection.photos.each_with_index do |photo_url, index|
  equipment_names = ['LED Lights', 'Sleeping bag', 'Camping table', 'Stove', 'Chairs']
  equipment = Equipment.create(name: equipment_names.sample, address: locations[index], price: 40, user: more)
  file = URI.parse(photo_url.urls.regular).open
  equipment.images.attach(io: file, filename: 'equipment.jpg', content_type: 'image/jpg')
end
