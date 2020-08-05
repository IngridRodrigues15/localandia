# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CharacterType.find_or_create_by(name: 'Arqueira') do |type|
  type.skills = '<b>Chuva de Flechas</b>: Não causa dano, mas afasta um inimigo'
  type.weapons = '<b>Arco de bambu</b>: causa 1d6 de dano<br><b>Aljava</b>: milagrosamente, carrega uma quantidade infinita de flechas'
  type.mana = 1
end

CharacterType.find_or_create_by(name: 'Espadachim') do |type|
  type.skills = '<b>Golpe Fulminante</b>: Causa dano normalmente e atordoa o inimigo (inimigos atordoados não atacam por um turno) caso passe em um teste de força, caso contrário causa dano parcialmente (50%)'
  type.weapons = '<b>Espadas</b>'
  type.mana = 2
end

CharacterType.find_or_create_by(name: 'Maga') do |type|
  type.skills = '<b>Upstream</b>: Uma barreira de água levanta-se do chão. Pode ser atravessada por um teste difícil de força apenas. Custa 2 mana.<br>
<b>Bola de Fogo</b>: Uma poderosa magia clássica e estilosa. Alguns magos chamam de Hadduken, Kamehameha ou Leigan, mas no final são todas bolas de fogo. Demora duas ações. Custa 2 mana e causa 2d20 de dano.<br>
<b>Meteorito</b>: Literalmente summona um meteorito, direto do espaço! Derrota instantaneamente qualquer adversário. Demora um dia inteiro. Requer mana da personagem completo e custa ele inteiro'
  type.weapons = "<b>Cajado de duas mãos</b>: causa 1d4 de dano"
  type.mana = 3
end

CharacterType.find_or_create_by(name: 'Sacerdotisa') do |type|
  type.skills = '<b>Refinamento</b>: Uma barreira circular que protege o time inteiro (caso estejam dentro do círculo). Todo dano sofrido é parcialmente diminuído (25%). Custa 5 (cinco) mana <br>
<b>Planejamento</b>: Levanta a moral do time. Todos os ataques aliados recebem +1. Custa 1 (um) mana<br>
<b>O Descer da Phoenix</b>: Revive um personagem e restaura toda a sua vida. Demora 3 ações. Requer mana da personagem completo e custa ele inteiro'
  type.weapons = "<b>Cajado de duas mãos</b>: causa 1d4 de dano"
  type.mana = 4
end

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
Item.find_or_create_by(name: 'Poção de energético') do |item|
  item.kind = 'Mercador'
  item.price = 80
  item.description = 'recupera 15 pontos de vida e 5 pontos de mana'
end
Item.find_or_create_by(name: 'Poção de Elixir') do |item|
  item.kind = 'Mercador'
  item.price = 120
  item.description = 'recupera toda a vida e a mana'
end
Item.find_or_create_by(name: 'Bolsa') do |item|
  item.kind = 'Mercador'
  item.price = 100
  item.description = 'milagrosamente, pode carregar quantos itens quiser'
end
Item.find_or_create_by(name: 'Aljava') do |item|
  item.kind = 'Mercador'
  item.price = 100
  item.description = 'milagrosamente, carrega uma quantidade infinita de flechas'
end

Item.find_or_create_by(name: 'Arco de bambu') do |item|
  item.kind = 'Ferreiro'
  item.price = 50
  item.description = 'causa 1d6 de dano'
end
Item.find_or_create_by(name: 'Arco de madeira') do |item|
  item.kind = 'Ferreiro'
  item.price = 100
  item.description = 'causa 1d6+1 de dano'
end
Item.find_or_create_by(name: 'Adaga sem corte') do |item|
  item.kind = 'Ferreiro'
  item.price = 10
  item.description = 'causa 1d4 de dano'
end
Item.find_or_create_by(name: 'Adaga afiada') do |item|
  item.kind = 'Ferreiro'
  item.price = 50
  item.description = 'causa 1d6 de dano'
end
Item.find_or_create_by(name: 'Espada do mostruário') do |item|
  item.kind = 'Ferreiro'
  item.price = 100
  item.description = 'causa 1d8 de dano'
end
Item.find_or_create_by(name: 'Espada afiada') do |item|
  item.kind = 'Ferreiro'
  item.price = 200
  item.description = 'causa 1d12 + 1  de dano'
end
Item.find_or_create_by(name: 'Espada de duas mãos') do |item|
  item.kind = 'Ferreiro'
  item.price = 350
  item.description = 'requer força > 5, 2d12 de dano'
end
Item.find_or_create_by(name: 'Escudo') do |item|
  item.kind = 'Ferreiro'
  item.price = 150
  item.description = 'requer teste de agilidade, absorve completamente o dano de armas pequenas, completamente o dano de armas grandes caso passe em teste de força (falha na defesa caso erre), parcialmente de armas grandes (50%)'
end


Characteristic.find_or_create_by(name: 'Agilidade') do |characteristic|
  characteristic.description = "Personagens ágeis são muito rápidas e perspicazes. São sempre cheias de artimanhas! Conseguem atacar duas vezes em batalhas, ver detalhes que mais ninguém vê, desviar de ataques e escalar qualquer coisa."
end
Characteristic.find_or_create_by(name: 'Carisma') do |characteristic|
  characteristic.description = "Personagens carismáticas são as melhores para se ter por perto! São comunicativas e bem articuladas. Costumam ser levadas a sério, são convincentes, conseguem informações extras e barganhas incríveis."
end
Characteristic.find_or_create_by(name: 'Conhecimento') do |characteristic|
  characteristic.description = "Personagens de vasto conhecimento são sábias e inteligentes. São confiáveis e essenciais para qualquer aventura. Costumam saber o que/como fazer, lembrar de informações importantes, ganhar discussões e usar várias magias."
end
Characteristic.find_or_create_by(name: 'Força') do |characteristic|
  characteristic.description = "Personagens fortes são detentoras de extremo poder físico. São destemidas e impressionantes! Conseguem levantar coisas muito pesadas, causar ataques físicos devastadores, empurrar/arremessar coisas a uma longa distância e intimidar/provocar a qualquer um!"
end
Characteristic.find_or_create_by(name: 'Vitalidade') do |characteristic|
  characteristic.description = "Personagens de vitalidade elevada possuem alto vigor e energia. São resistentes e estão sempre dispostos. Conseguem manter testes bem sucedidos de agilidade e força por um longo período, mater-se de pé quando ninguém mais consegue, sofrer dano reduzido de efeitos especiais e possuem uma vida mais longa."
end
