# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: 'gsapp@x1s.eti.br', name: 'Pedro Ivo', password: '123123123')
garage = user.create_garage(name: 'mosma', description: 'Garagem do MoSMA, varios produtos novos todos as semanas, aproveite.',
  city: 'Goiania', state: 'Goias', tags: ['mosma', 'goiania', 'cowork'])
garage.avatar = File.new("#{Rails.root}/public/img/mosma-icon.png")
garage.save

product = garage.products.create(name: 'Cadeirinha Black Diamond', description: 'Cadeirinha Black Diamond 

Tá meio suja mas foi pouco usada, comprada a menos de 1 ano, usada umas 10 vezes só.',
  value: 250, currency: 'BRL', tags: ['escalada', 'cadeirinhs', 'climb', 'equipamento', 'outdoor'])

product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p11.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p12.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p13.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p14.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p15.jpg"))


product = garage.products.create(name: 'Caloi Sprint 2011', description: 'Bike da Caloi, pouco usada 

Tamanho. M
Quadro de aluminio
Shimano 2300.

http://caloi.com.br/bikes/sprintlinha2012',
  value: 950.10, currency: 'BRL', tags: ['bike', 'speed', 'caloi', 'sprint'])

product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p21.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p22.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p23.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p24.jpg"))



user = User.create(email: 'brilho@x1s.eti.br', name: 'Brilho da Sereia', password: '123123123')
garage = user.create_garage(name: 'brilhodasereia', description: 'Veja toda nossa decoração à venda',
  city: 'Goiania', state: 'Goias', tags: ['brilhodasereia', 'moda', 'decoracao'])
garage.avatar = File.new("#{Rails.root}/public/img/brilhodasereia-icon.jpg")
garage.save

product = garage.products.create(name: 'Almofada Fleur', description: 'Almofada com estampa de flores',
  value: 250, currency: 'BRL', tags: ['brilhodasereia', 'decoracao', 'almofada'])

product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p31.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p32.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p33.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p34.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p35.jpg"))


product = garage.products.create(name: 'Quadro Barco Branco', description: 'Quadro com imagem de um barco branco com vermelho!',
  value: 950.10, currency: 'BRL', tags: ['brilhodasereia', 'decoracao', 'quadro', 'barco'])

product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p41.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p42.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p43.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p44.jpg"))


product = garage.products.create(name: 'Almofada "B" - Beijos', description: 'Almofada em formato da letra "B" com uma etiqueta de beijos. Ótimo presente!!!',
  value: 950.10, currency: 'BRL', tags: ['brilhodasereia', 'decoracao', 'almofada'])

product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p51.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p52.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p53.jpg"))




