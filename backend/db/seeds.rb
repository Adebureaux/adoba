# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

collection1 = Collection.create(name: "Collecte de yaourts", date: "2023-03-08", association_name: "Les Restos du Cœur", dynamic_attributes: { dynamic_attributes: { Poids: "25Kg", "Nombre de participants": "12" } } )
collection2 = Collection.create(name: "Recuperation fruits et legumes divers", date: "2023-05-11", association_name: "Saint-Vincent-de-Paul", dynamic_attributes: { dynamic_attributes: { Poids: "48Kg", "Nombre de participants": "15" } } )
collection3 = Collection.create(name: "Don produits secs", date: "2023-06-11", association_name: "Banque Alimentaire", dynamic_attributes: { dynamic_attributes: { Poids: "16Kg", "Nombre de participants": "3" } } )

indicator = Indicator.create(dynamic_attributes: ["Poids", "Nombre de participants"])
