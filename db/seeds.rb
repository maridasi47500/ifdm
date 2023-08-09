# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Weekday.destroy_all
Level.destroy_all
Schedule.destroy_all
Weekday.create([{name: "Lundi"},{name:"mardi"},{name:"mercredi"},{name:"jeudi"},{name:'venredi'}])
Level.create([{name: "débutant"},{name:"moyen"},{name:"intermédiaire"},{name:"avancé"}])
Schedule.create([{name:"14h30-15h30"},{name: "15h30-16h30"},{name:"16h30-17h30"},{name:"17h30-18h30"},{name:"18h30-19h30"},{name:"19h30-20h30"}])

