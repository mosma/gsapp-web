# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

all = Category.create(name: "All Products", key: 'all')

men = all.children.create(name: "Men's", key: 'men')
clothing = men.children.create(name: "clothing", key: 'clothing')
tops = clothing.children.create(name: "Tops", key: 'tops')
bottoms = clothing.children.create(name: "Bottoms", key: 'bottoms')
outerwear = clothing.children.create(name: "Outerwear", key: 'outerwear')
suits = clothing.children.create(name: "Suits", key: 'suits')

shoes = men.children.create(name: "Shoes", key: 'shoes')
casual = shoes.children.create(name: "Casual", key: 'casual')
sneakers = shoes.children.create(name: "Sneakers", key: 'sneakers')
dress = shoes.children.create(name: "Dress", key: 'dress')
boots = shoes.children.create(name: "Boots", key: 'boots')
sandals = shoes.children.create(name: "Sandals", key: 'sandals')

accessories = men.children.create(name: "Accessories", key: 'accessories')
bags = accessories.children.create(name: "Bags", key: 'bags')
watches = accessories.children.create(name: "Watches", key: 'watches')
wallets = accessories.children.create(name: "Wallets", key: 'wallets')
belts = accessories.children.create(name: "Belts", key: 'belts')
ties = accessories.children.create(name: "Ties", key: 'ties')
hats = accessories.children.create(name: "Hats", key: 'hats')
glasses = accessories.children.create(name: "Glasses", key: 'glasses')

woman = all.children.create(name: "Woman's", key: 'woman')
clothing = woman.children.create(name: "clothing", key: 'clothing')
dresses = clothing.children.create(name: "Dresses", key: 'dresses')
tops = clothing.children.create(name: "Tops", key: 'tops')
bottoms = clothing.children.create(name: "Bottoms", key: 'bottoms')
outerwear = clothing.children.create(name: "Outerwear", key: 'outerwear')
underwear = clothing.children.create(name: "Underwear", key: 'underwear')

shoes = woman.children.create(name: "Shoes", key: 'shoes')
sandals = shoes.children.create(name: "Sandals", key: 'sandals')
heels = shoes.children.create(name: "Heels", key: 'heels')
flats = shoes.children.create(name: "Flats", key: 'flats')
boots = shoes.children.create(name: "Boots", key: 'boots')
sneakers = shoes.children.create(name: "Sneakers", key: 'sneakers')

accessories = woman.children.create(name: "Accessories", key: 'accessories')
bags = accessories.children.create(name: "Bags", key: 'bags')
watches = accessories.children.create(name: "Watches", key: 'watches')
belts = accessories.children.create(name: "Belts", key: 'belts')
jewelry = accessories.children.create(name: "Jewelry", key: 'jewelry')
hair = accessories.children.create(name: "Hair", key: 'hair')
hats = accessories.children.create(name: "Hats", key: 'hats')
scarves = accessories.children.create(name: "Scarves", key: 'scarves')
glasses = accessories.children.create(name: "Glasses", key: 'glasses')

beauty = woman.children.create(name: "beauty", key: 'beauty')

tech = all.children.create(name: "Tech", key: 'tech')
audio = tech.children.create(name: "Audio", key: 'audio')
turntables = audio.children.create(name: "Turntables", key: 'turntables')
headphones = audio.children.create(name: "Headphones", key: 'headphones')
speakers = audio.children.create(name: "Speakers", key: 'dpeakers')
instruments = audio.children.create(name: "Instruments", key: 'instruments')

camera = tech.children.create(name: "Camera", key: 'camera')
aigital = camera.children.create(name: "Digital", key: 'digital')
analog = camera.children.create(name: "Analog", key: 'analog')
accessories = camera.children.create(name: "Accessories", key: 'accessories')
accessories = tech.children.create(name: "Accessories", key: 'accessories')
laptop = accessories.children.create(name: "Laptop", key: 'laptop')
phone = accessories.children.create(name: "Phone", key: 'phone')
other = accessories.children.create(name: "Other", key: 'other')

media = all.children.create(name: "Media", key: 'media')
books = media.children.create(name: "Books", key: 'books')
music = media.children.create(name: "Music", key: 'music')
movies = media.children.create(name: "Movies", key: 'movies')


home = all.children.create(name: "Home", key: 'men_products')
kitchen = home.children.create(name: "kitchen", key: 'kitchen')
Cookware = kitchen.children.create(name: "Cookware", key: 'cookware')
coffee_tea = kitchen.children.create(name: "Coffee_Tea", key: 'coffee_tea')
storage = kitchen.children.create(name: "Storage", key: 'storage')
cutlery = kitchen.children.create(name: "Cutlery", key: 'cutlery')
utensils = kitchen.children.create(name: "Utensils", key: 'utensils')
appliances = kitchen.children.create(name: "Appliances", key: 'appliances')
accessories = kitchen.children.create(name: "Accessories", key: 'accessories')

bedding = home.children.create(name: "Bedding", key: 'bedding')
bath = home.children.create(name: "Bath", key: 'bath')
furniture = home.children.create(name: "Furniture", key: 'furniture')
decor = home.children.create(name: "Decor", key: 'decor')

rugs = decor.children.create(name: "Rugs", key: 'Rugs')
lighting = decor.children.create(name: "Lighting", key: 'lighting')
accessories = decor.children.create(name: "Accessories", key: 'accessories')
pillows = decor.children.create(name: "Pillows", key: 'pillows')
clocks = decor.children.create(name: "Clocks", key: 'clocks')

art = all.children.create(name: "Art", key: 'men_products')
a3d = art.children.create(name: "3D", key: 'a3d')
posters = art.children.create(name: "Posters", key: 'posters')
photography = art.children.create(name: "Photography", key: 'photography')
collage = art.children.create(name: "Collage", key: 'collage')
supplies = art.children.create(name: "Supplies", key: 'supplies')

other = all.children.create(name: "Other", key: 'men_products')
booze = other.children.create(name: "Booze", key: 'booze')
cycling = other.children.create(name: "Cycling", key: 'cycling')
toys = other.children.create(name: "Toys", key: 'toys')
games = other.children.create(name: "Games", key: 'games')
antiques = other.children.create(name: "Antiques", key: 'antiques')
pets = other.children.create(name: "Pets", key: 'pets')
camping = other.children.create(name: "Camping", key: 'camping')
tools = other.children.create(name: "Tools", key: 'tools')


user = User.create(email: 'gsapp@x1s.eti.br', name: 'Pedro Ivo', password: '123123123')
garage = user.create_garage(name: 'mosma', description: 'Garagem do MoSMA, varios produtos novos todos as semanas, aproveite.',
  city: 'Goiania', state: 'Goias', tags: ['mosma', 'goiania', 'cowork'])
garage.avatar = File.new("#{Rails.root}/public/img/mosma-icon.png")
garage.save

product = garage.products.create(name: 'Cadeirinha Black Diamond', description: 'Cadeirinha Black Diamond 

Tá meio suja mas foi pouco usada, comprada a menos de 1 ano, usada umas 10 vezes só.',
  value: 250, currency: 'BRL', tags: ['Tech','escalada', 'cadeirinhs', 'climb', 'equipamento', 'outdoor'])

product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p11.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p12.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p13.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p14.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p15.jpg"))

product.value = 249.90
product.save

product = garage.products.create(name: 'Caloi Sprint 2011', description: 'Bike da Caloi, pouco usada 

Tamanho. M
Quadro de aluminio
Shimano 2300.

http://caloi.com.br/bikes/sprintlinha2012',
  value: 950.10, currency: 'BRL', tags: ['bike', 'Boots', 'speed', 'caloi', 'sprint'])

product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p21.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p22.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p23.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p24.jpg"))

product.value = 49
product.save

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

product.value = 76.33
product.save

product = garage.products.create(name: 'Quadro Barco Branco', description: 'Quadro com imagem de um barco branco com vermelho!',
  value: 950.10, currency: 'BRL', tags: ['brilhodasereia', 'Movies', 'decoracao', 'quadro', 'barco'])

product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p41.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p42.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p43.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p44.jpg"))

product.value = 453.333
product.save

product = garage.products.create(name: 'Almofada "B" - Beijos', description: 'Almofada em formato da letra "B" com uma etiqueta de beijos. Ótimo presente!!!',
  value: 950.10, currency: 'BRL', tags: ['brilhodasereia', 'decoracao', 'almofada'])

product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p51.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p52.jpg"))
product.medias.create(image: File.new("#{Rails.root}/public/img/p-test/p53.jpg"))

product.value = 112
product.save



