require 'httpclient'
require "open-uri"

class LoadMediaWorker
  # include Sidekiq::Worker
  # include Sidetiq::Schedulable

  # sidekiq_options queue: :news

  def self.perform

    Garage.all.each do |garage|
      url = URI.parse("http://api.garagesaleapp.me/product/#{garage.name}")
      open(url) do |http|
        response = JSON.parse http.read
        response.each do |g|
          create_product(garage, g)
        end
      end

    end

  end

  def self.create_product garage, product
    prod = garage.products.create(
      name: product['nome'],
      description: product['descricao'],
      value: product['valorEsperado'],
      currency: product['currency'],
      tags: product[''],
      status: product['idEstado'],
      link: product['link'],
      tags: ['loading']
      )
    fotos = product['fotos']
    if fotos
      fotos.each do |fff|
        a = fff
        b = a['caminho'] if a['caminho']
        c = b['original'] if b['original']
        d = c.gsub("http://photos.garagesaleapp.me","")
        e = "/Users/pedroivobgimenes/Documents/gsapp-images/originals20140222#{d}"
        prod.medias.create(image: open(e)) if File.file?(e)
        # a = fff
        # b = a['caminho'] if a['caminho']
        # c = b['original'] if b['original']
        # if c 
        #   httpc = HTTPClient.new
        #   resp = httpc.get(c)
        #   url = resp.header['Location']
        #   prod.medias.create(image: open(url[0]))
        # end
      end
    end
  end

end
