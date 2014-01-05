# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'gsapp@x1s.eti.br', name: 'Pedro Ivo', password: '123123123')
garage = user.create_garage(name: 'mosma', description: 'Garagem do MoSMA, varios produtos novos todos as semanas, aproveite.',
  city: 'Goiania', state: 'Goias', tags: ['mosma', 'goiania', 'cowork']) #,
  #avatar: File.new("#{Rails.root}/../public/img/mosma-icon.jpg"))

product = garage.products.create(name: 'Cubo MoSMA', description: 'Lindo cubo de acrilico com a logo do MoSMA',
  value: 10, currency: 'BRL', tags: ['cubo', 'MoSMA'])

# product.media.create()