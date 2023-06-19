# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

collection1 = Collection.create(name: "collection1", date: "2023-06-15", association_name: "association1", dynamic_attributes: {test: "a"})
collection2 = Collection.create(name: "collection2", date: "2023-06-15", association_name: "association2", dynamic_attributes: {test: "b"})
collection3 = Collection.create(name: "collection3", date: "2023-06-16", association_name: "association3", dynamic_attributes: {image: "https://static.actu.fr/uploads/2022/11/photo-banque-alimentaire-collecte-hivernale.jpg"})

indicator = Indicator.create(dynamic_attributes: ["poids", "nombre de participants"])
