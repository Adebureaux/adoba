class Collection < ApplicationRecord
  validates_uniqueness_of :name, message: "Ce nom de collecte est déjà utilisé"
	validates :name, presence: true, length: {minimum: 3, maximum: 50, message: "Le nom de la collecte doit comporter entre 3 et 50 caractères"}
	validates :date, presence: { message: "La date ests requise." }
	validates :association_name, presence: true, length: { minimum: 2, maximum: 30, message: "Le nom de l'association comporter entre 2 et 30 caractères"}
end
