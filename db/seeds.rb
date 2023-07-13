# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Private.create(name:"Guitare",description:"\n\nConnaître l’harmonie et la lecture de grilles d’accords
\nSavoir accompagner dans des styles modernes
\nDévelopper sa technique instrumentale.
\n✔ à partir de 8 ans
\n✔ Durée : 1 heure
\n✔ Forfait 4 cours 195 € ou 6 cours 279 €
")
Private.create(name:"Piano",description:"\nPiano d’interprétation \n
\nApprendre à déchiffrer une partition
\n
\nSavoir interpréter un morceau
\n
\nDévelopper sa technique instrumentale.
\n
\n✔ à partir de 7 ans
\n✔ Durée : 1 heure
\n✔ Forfait 4 cours 195 € ou 6 cours 279 €")
Private.create(name:"Piano",description:"\n\nPiano d’accompagnement 
\n
\nApprendre à jouer tous les accords et leur renversements
\n
\nSavoir jouer et accompagner dans des styles modernes variés.
\n
\n✔ à partir de 12 ans
\n✔ Durée : 1 heure
\n✔ Forfait 4 cours 195 € ou 6 cours 279 €")
Collective.create(name:"Technique vocale",description:"
\n
\nPlacer sa voix efficacement
\n
\nMaîtriser l’appareil phonatoire
\n
\nConstruire son identité stylistique.
\n
\n✔ à partir de 14 ans
\n✔ Durée : 1 heure
\n✔ Tarif : 720€ (30 cours + 6 séances d’atelier orchestre d’octobre à juin)
\n")
