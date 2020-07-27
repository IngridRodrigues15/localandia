# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Item.find_or_create_by(name: 'Mapa de Localândia') do |item|
  item.kind = 'Inicial'
  item.price = 0
end
Item.find_or_create_by(name: 'Pizza de ontem') do |item|
  item.kind = 'Inicial'
  item.price = 0
  item.description = 'recupera 5 pontos de vida e 1 ponto de mana'
end
Item.find_or_create_by(name: 'Faca de passar pão') do |item|
  item.kind = 'Inicial'
  item.price = 0
  item.description = 'causa 1d4 de dano'
end
Item.find_or_create_by(name: 'Poção de café') do |item|
  item.kind = 'Mercador'
  item.price = 30
  item.description = 'recupera 5 pontos de vida e 1 ponto de mana'
end

Attribute.find_or_create_by(name: 'Agilidade')
Attribute.find_or_create_by(name: 'Carisma')
Attribute.find_or_create_by(name: 'Conhecimento')
Attribute.find_or_create_by(name: 'Força')
Attribute.find_or_create_by(name: 'Vitalidade')
