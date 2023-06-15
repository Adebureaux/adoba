# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

collectionnn1 = Collection.create(name: "collection1", date: "2023-06-15T11:11:11", association_name: "association1")
collectionnn2 = Collection.create(name: "collection2", date: "2023-06-15T12:42:42", association_name: "association2")
collectionnn3 = Collection.create(name: "collection3", date: "2023-06-16T15:45:12", association_name: "association3", dynamic_attributes: { image: "https://static.actu.fr/uploads/2022/11/photo-banque-alimentaire-collecte-hivernale.jpg" })